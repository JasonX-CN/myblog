{% extends './includes/base.swig' %}

{% block content %}
    <div class="al_index_background dis_flex_center al_full_cover">
        <div class="al_pos_ab al_letter al_index_background_letter">
            {{ config.bio|default('Jason')|first|upper }}
        </div>
        <h2 class="al_index_background_bio">
            {{ config.bio|default('A Personal Page Of Jason') }}
        </h2>
    </div>

    <div class="al_index_container">
        <div class="al_pos_ab al_fake_background"></div>
        <div class="al_main_container al_shadow">
            <div class="al_section_container dis_flex_jcenter">
                <div class="section_header">
                    LATEST PAGES
                </div>
            </div>

            <ul class="al_post_list">
                {% for item in page.posts %}
                    <li class="al_index_pageList_item al_index_page_seperator">
                        <div class="al_index_post_title_cnt dis_flex">
                            <div class="al_pos_ab al_letter al_index_post_title_letter">
                                {{ item.title|default('No Title')|first|upper }}
                            </div>
                            <h2 class="al_index_post_title">
                                <a href="{{ url_for(item.link || item.path) }}">
                                    {{ item.title|default('No Title') }}
                                </a>
                            </h2>
                            <div class="al_index_post_extra dis_flex">
                                <div class="al_index_post_date al_index_post_extra_item">
                                    {{ item.date|date('F d') }}
                                </div>

                                {% if min2read %}
                                    <div class="al_index_post_read_time">
                                        {{ min2read(item.content) }} Min Read
                                    </div>
                                {% endif %}

                            </div>
                        </div>
                        <div class="al_index_post_excerpt_cnt">
                            <p class="al_index_post_excerpt">
                                {{ item.excerpt|striptags }}
                            </p>
                        </div>                    
                {% endfor %}
            </ul>

            <nav class="dis_flex al_post_nav">
                <a class="al_post_nav_item dis_flex_acenter" href="{{ page.next_link || '/' }}">
                    {% if page.prev !== 0 %}
                        <svg class="al_arrow">
                            <use xmlns="http://www.w3.org/2000/svg" xlink:href="/assets/svg_icons.svg#svg-arrow-left"></use>
                        </svg>
                        <span>Newer Posts</span>
                    {% endif %}
                </a>
                <a class="al_post_nav_item dis_flex_acenter" href="{{ page.next_link || '/' }}">
                    {% if page.next !== 0 %}
                        <span>Older Posts</span>
                        <svg class="al_arrow">
                            <use xmlns="http://www.w3.org/2000/svg" xlink:href="/assets/svg_icons.svg#svg-arrow-right"></use>
                        </svg>
                    {% endif %}
                </a>
            </nav>
        </div>
    </div>
{% endblock %}