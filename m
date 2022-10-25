Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D508560C322
	for <lists+linux-usb@lfdr.de>; Tue, 25 Oct 2022 07:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiJYFK5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 01:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJYFK4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 01:10:56 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBE582842
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 22:10:55 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id f9so6135882pgj.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 22:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7HV+2O7fdwVJwRzKmZ0rsq+s0/h80leow5C99ZjbCk=;
        b=hkb8xybnSV2gWZ/UtkvEPpfkO9Qxb6o8Q2XSPI5eJ9LUXXPMNBhL4F2b0G9DVHZVZO
         awtvkuVsFDXqLILkIAFxE3RVv3E5XRZR0JaeROlmKN5+6X1Lt/Jm29PdHcUMo+fQ6A3P
         jwMXSR7no7u/SZfrAu29FdTM5sRnz1Q1ZRaf29kNy5Becp/1KFnILui60x9ufO9cBrmj
         7mVPiaL3PHg+3wGdQcf0Cu6CN+RqNkLRAHOkLqXiYCxac13fnnz0Zoxn8YlDIsKEXoIZ
         rqWK4XDtIKRHfxG1P87J2+Lsqt57ZUTiIHk/lqLONELr8aJxcdQ95U1NWbsUDOYCmZAb
         1oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7HV+2O7fdwVJwRzKmZ0rsq+s0/h80leow5C99ZjbCk=;
        b=O0PPcBmpZGeYYKICP1Ctlh0KOGdIUQtm62anQwwMU9azR7evqdi5MYSRGyJoqDoROS
         xF9bmdzztoPTZXwceWcbMYIOHxOdVvCYoRSHK63pxIqsDS/TLWjSi4uhDdwreFW1OYmz
         VERmw3uLZrQmFw5119866QrQmjYZjCVausMD7anJoTNvZLwbCp+ydmc8t3RmrMRIBytw
         eRozhEZ+zQi0hyhaqfTY/hL6J45qxWs06F/rDNPs5fhj6xrPdyNqZVFZhvZp9GJ9byCl
         kmCwJ9F8IPZuskCvHkdfqbRllCOZOptaenMcp9sJ0PfRKsooL9MvOQGdjW3FENrapD2p
         tvxw==
X-Gm-Message-State: ACrzQf3BCjVOnBx7fJNdAWpTNraj9Ahu+OqYr1zJ8d2yie+c/PCNEupy
        6WppotebNYUVXvAFOwvpslrmTw==
X-Google-Smtp-Source: AMsMyM4dqBh79PBmEq4bNi3bKpyxWmF8pKyrddK0RgHHrwPwJ9UaGdcmUV9KpdRicCKxD5dzSxxkQw==
X-Received: by 2002:a63:db42:0:b0:45c:9c73:d72e with SMTP id x2-20020a63db42000000b0045c9c73d72emr30514395pgi.181.1666674654641;
        Mon, 24 Oct 2022 22:10:54 -0700 (PDT)
Received: from localhost ([122.172.87.26])
        by smtp.gmail.com with ESMTPSA id v6-20020a17090a00c600b001ef8ab65052sm667404pjd.11.2022.10.24.22.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 22:10:54 -0700 (PDT)
Date:   Tue, 25 Oct 2022 10:40:52 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lubomir Rintel <lkundrak@v3.sk>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Chubb <peter.chubb@unsw.edu.au>,
        Stefan Eletzhofer <stefan.eletzhofer@eletztrick.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/11] ARM: sa1100: remove unused board files
Message-ID: <20221025051052.qn2ruyjdkawwwida@vireshk-i7>
References: <20221021155000.4108406-1-arnd@kernel.org>
 <20221021155000.4108406-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021155000.4108406-3-arnd@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-10-22, 17:49, Arnd Bergmann wrote:
> diff --git a/drivers/cpufreq/sa1110-cpufreq.c b/drivers/cpufreq/sa1110-cpufreq.c
> index 1a83c8678a63..bb7f591a8b05 100644
> --- a/drivers/cpufreq/sa1110-cpufreq.c
> +++ b/drivers/cpufreq/sa1110-cpufreq.c
> @@ -344,14 +344,8 @@ static int __init sa1110_clk_init(void)
>  	if (!name[0]) {
>  		if (machine_is_assabet())
>  			name = "TC59SM716-CL3";
> -		if (machine_is_pt_system3())
> -			name = "K4S641632D";
> -		if (machine_is_h3100())
> -			name = "KM416S4030CT";
>  		if (machine_is_jornada720() || machine_is_h3600())
>  			name = "K4S281632B-1H";
> -		if (machine_is_nanoengine())
> -			name = "MT48LC8M16A2TG-75";
>  	}
>  
>  	sdram = sa1110_find_sdram(name);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
