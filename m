Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A6153B567
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 10:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbiFBIuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 04:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbiFBIuV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 04:50:21 -0400
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04801F32;
        Thu,  2 Jun 2022 01:50:21 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id q21so5559945wra.2;
        Thu, 02 Jun 2022 01:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gmY8ywIJ8F2I38doLeHcwbGV1/5/O2stuxqKMcaXVis=;
        b=IKt1rHDhLOyK2xwDnmUX7aKyP+cjdv+4hf9VZO4LSXCTIddKluVRG8hsp8TFsd7io4
         p+FXmu1JPjw6P8Cv0Y9uMbIRbUxF51xSi+9WifNiaXbs8bLj6Y64PqyCU0/5B7uk1wFE
         04Gzm479qUnurg8NK2OJkVAn0Q++MDhgZHhpRnmzmclbxX54z/T78ztb9jUbsUu2Cxb6
         JLSzuqtZgwfH8jycSjCHU28AjPTAMkmCN8pfWtneM+za7SuNIXFnn6TVZHYB57P4CvTG
         aZyimkQiMMCf7DG6GfpT1t/CEF1r8Fts33AmIpTVECcduHcARTocRrZeEjdQchcPxaTc
         UnmA==
X-Gm-Message-State: AOAM5320TWGsLTz6q3INwMjCC7+hguR5GsSssM/+XENeLboqla+kegn4
        bjQS1V3fjmI0/nbV2jAfLG4=
X-Google-Smtp-Source: ABdhPJyRfwLpUe0vnTrnAcYsmqjA/G9rcoe2XN7lRPH+iDnSXvJ0+K30sLG5fOGdSpB+uFEoN1ylIQ==
X-Received: by 2002:a5d:6da4:0:b0:20f:ea39:6660 with SMTP id u4-20020a5d6da4000000b0020fea396660mr2745962wrs.209.1654159819440;
        Thu, 02 Jun 2022 01:50:19 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c154600b00397402ae674sm8959918wmg.11.2022.06.02.01.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 01:50:18 -0700 (PDT)
Message-ID: <22ccc180-a3ab-77cf-a771-00113e712ac4@kernel.org>
Date:   Thu, 2 Jun 2022 10:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/6] serial: core: add sysfs attribute to suppress
 ready signalling on open
Content-Language: en-US
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
References: <20220531043356.8CAB637401A9@freecalypso.org>
 <20220531043655.DDF783740232@freecalypso.org>
 <dbec85f5-7b28-3d0b-6b39-bd4296a49a70@kernel.org>
 <CA+uuBqacb3X+km-3EtdRxaWi0FvxZWCv8RpCo-+qaNkT-=JAgw@mail.gmail.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CA+uuBqacb3X+km-3EtdRxaWi0FvxZWCv8RpCo-+qaNkT-=JAgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02. 06. 22, 10:35, Mychaela Falconia wrote:
> Jiri Slaby wrote:
> 
>> s@ttyS0@ttyS<x>@
>> [...]
>> sysfs_emit()? (Even if I know %d won't overflow PAGE_SIZE :P.)
> 
> Thanks for the feedback - saving it for v3 of my patch series.
> 
> Any comments, positive or negative, on the principal/philosophical
> idea behind this proposed patch series?

Neutral. As long as you break no currently supported devices.

I've just noticed the double negative "!tty_port_nordy()" on both calls 
of that function. I guess there was already a discussion about the 
naming, but wouldn't it make more sense to dub it like tty_port_do_rtscts()?

thanks,
-- 
js
suse labs
