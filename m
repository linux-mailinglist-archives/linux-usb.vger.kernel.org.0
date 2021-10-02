Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712E241FC7E
	for <lists+linux-usb@lfdr.de>; Sat,  2 Oct 2021 16:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhJBO0V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Oct 2021 10:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhJBO0V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Oct 2021 10:26:21 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75221C0613EC
        for <linux-usb@vger.kernel.org>; Sat,  2 Oct 2021 07:24:35 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso15359923ota.8
        for <linux-usb@vger.kernel.org>; Sat, 02 Oct 2021 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4kyU+RC1s1W4Prd2J/eqoa0bc9xDHzgm8cils6Dps0g=;
        b=ASTMFFw/ouJhICLKWSKmeZYwsv8LZtkqdDWt6qL8ZBQNr2gq8P4j6CiJpqm7pU9B7o
         No5kZ5jV+ExVN9SWehh6OAF5xvOkKlCseSD6bs9bJFnNGdvD7Aw5y/dkLODz/3eZ4F2o
         hfEMKp/B5lMU2JNXlirCg7B3/1iZfMU+CeLHawlei3oqPZYYqy39exf3UdjUg83oIAh+
         NgmOebTXARpLiz8I6uikY3uU+kq65gfFEbCoFBriSEAODNHPdv/xepbuYxNNGXnZmfsQ
         5ZgpI6Y6dZGpBbUPQoRAvVR9QLUQOdmzElIsGOi5Kso4cgpf4/l+OWQqcL2tv0+w77o0
         SAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4kyU+RC1s1W4Prd2J/eqoa0bc9xDHzgm8cils6Dps0g=;
        b=KLxKIrh/fEKCz3EHprXLZmmv/WP5m5VAafkw6hYy4n+xodT4m2/3dNictu9rmxGvbN
         lKwrSk3QkKQMoXHmDiogU+r5eeceiWKUJF+8tE76D0mL7z9cBQnJoEaz3wox/HevcZCz
         K5/+16j5CZvGLdRMA5sAige3VrY1uMd3ql5JKgOJvZx9+bG8a28a0BBxjdwPkJVlxqfJ
         4V59AK4pCvgEHG1ZtmSkzFv2vp9A7pp0iUVtowGR2b2h8h2l9Q55H41FxY/xU84zPr1w
         en+yYR0WFJwDJpNMVijl8vWh8NoCQJoQaiqpb+K8cZdt+IeBXgHZcDvn/DBcQnT1C/pd
         SARA==
X-Gm-Message-State: AOAM530OHdbhUjtMGCBBna6odOaH5OlOP/CNZsRLTHItDu4P5OPj7zcL
        1jxMiXjcRDXeBzpTJwksJb0=
X-Google-Smtp-Source: ABdhPJxZygGuDwmCCpx/VlIloApTvKmSG59VFsuL1aNNpxwzXjXvf4XMMgYgsnCSBly8ILPai4dxVA==
X-Received: by 2002:a9d:1910:: with SMTP id j16mr2655730ota.225.1633184674827;
        Sat, 02 Oct 2021 07:24:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 18sm1759642otj.10.2021.10.02.07.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 07:24:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 2 Oct 2021 07:24:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: handle SRC_STARTUP state if cc changes
Message-ID: <20211002142433.GD34532@roeck-us.net>
References: <20210928111639.3854174-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928111639.3854174-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 28, 2021 at 07:16:39PM +0800, Xu Yang wrote:
> TCPM for DRP should do the same action as SRC_ATTACHED when cc changes in
> SRC_STARTUP state. Otherwise, TCPM will transition to SRC_UNATTACHED state
> which is not satisfied with the Type-C spec.
> 
> Per Type-C spec:
> DRP port should move to Unattached.SNK instead of Unattached.SRC if sink
> removed.
> 
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a4d37205df54..7f2f3ff1b391 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4876,6 +4876,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
>  		break;
>  	case SRC_ATTACHED:
> +	case SRC_STARTUP:
>  	case SRC_SEND_CAPABILITIES:
>  	case SRC_READY:
>  		if (tcpm_port_is_disconnected(port) ||
> -- 
> 2.25.1
> 
