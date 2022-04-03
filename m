Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC7F4F0B92
	for <lists+linux-usb@lfdr.de>; Sun,  3 Apr 2022 19:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359673AbiDCRYx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Apr 2022 13:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357489AbiDCRYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Apr 2022 13:24:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3153A5D0
        for <linux-usb@vger.kernel.org>; Sun,  3 Apr 2022 10:22:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e16so13237250lfc.13
        for <linux-usb@vger.kernel.org>; Sun, 03 Apr 2022 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qvUMaOS002CHGHnfmq9XqLBrhzMozrZ5avLd7wbF3tE=;
        b=I8cpl4rChvV8SuPAlnMe6Em5VUbJBRIOItMRO1LdVzLA5i0ZyWItZIb59FF9EzXw7p
         bdUR7i1A4crvHB3rfkxcutiR4U7byArd3bnrYkIeFRrwh6tCPz2OlT+Fu39Kyv66aD3R
         IkO7JjXWT9gFModITYA3by5oiQeOJ0EuQGnBaOO0ipmKs2U0XmS4j9Ecxe1SsgjTLZle
         1y5MgEVd8i6m5JRYxor+6GRIoGX0wFodMY9YQ5tkoa9UdaOYC/tM+hrpr4YNonIZNQr6
         0lOmuv3umljQkzMpKfP6YDnCdzEJQgah0vM6nLz65SNLP7UBvJhizGBLDDephefN/6Wc
         gRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qvUMaOS002CHGHnfmq9XqLBrhzMozrZ5avLd7wbF3tE=;
        b=YczSPxQEIjqeZcw7zrrFK/ZJoIOSM+wRksMmu3LhvDd33RqD8Cn19wh4tepRdGzj1k
         Lai/4pS4aU1eDun+XSTVKm9fk1by3P7aiHil6MCtxOzdxXp76UsAcKOVDcxyL7mZVzl5
         TgnzgUUVUmRDnLENfwbyldaW0UtcfJC7X+gnJWZ4p9ffTphfm2aPvtoG8sSVu+h9oaow
         yPDKB5s8gP3QOWqC6yYQ6JsjPWizKZtOytCrCQMvu7zxNnKA55/C0E3caesJqtJi5JM+
         RNOqO6ndaprUNnTnLQW5z0AtTyU2cHpdJEtM+rVrPrH4W0BdqKZSLWG8rOet/pUH6Lov
         cOsA==
X-Gm-Message-State: AOAM532ewpGDRji1pIBMzYvR+6MosOi1mkCcjy6wlD1AUzk9/tM2ClKv
        +Y6uzPPPv8Xcqf+Zzyf5UiC8NGsXquo=
X-Google-Smtp-Source: ABdhPJxTwjFEISVaOD6Mw8NVk4Ev0hOx87fXMmPGSwv7r84n+U/PhBFp9JCtrieep8xSa5C8/tWfZw==
X-Received: by 2002:a19:dc0f:0:b0:439:702c:d83b with SMTP id t15-20020a19dc0f000000b00439702cd83bmr19773194lfg.192.1649006565800;
        Sun, 03 Apr 2022 10:22:45 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.85.88])
        by smtp.gmail.com with ESMTPSA id b20-20020a196454000000b0044a700c4e99sm871657lfj.309.2022.04.03.10.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 10:22:45 -0700 (PDT)
Subject: Re: Buffer overflow in drivers/usb/host/ehci-sched.c?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <2f9e5b99-c527-9c54-7fd3-0f052be982dc@gmail.com>
 <Ykm6ja7RggR367cC@rowland.harvard.edu>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <58902d03-c789-c13a-b8af-39249bf0fd0f@gmail.com>
Date:   Sun, 3 Apr 2022 20:22:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Ykm6ja7RggR367cC@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/3/22 6:17 PM, Alan Stern wrote:

>>    The following function in the EHCI scheduling code causes the SVACE static analyzer to
>> report possible buffer overflow (see the last assignment below), e.g.:
>>
>> Buffer 'ehci->bandwidth' of size 64 accessed at ehci-sched.c:240 can overflow, since its
>> index 'i + j' can have value 66 that is out of range, as indicated by preceding conditional
>> expression at ehci-sched.c:240.
> 
> Not sure what you mean.

   What SVACE means, in this case. :-)

>  In my copy of the file, line 240 is the assignment.

   For SVACE as well. This is not a full report -- some details did follow but I failed
to copy/paste them...

> There is a conditional in line 239 and in line 238 (the "for" condition), 
> but I don't see how either one indicates that i+j could be as large as 66.

   SVACE doesn't know what qh->ps.bw_uperiod could be...

>>    I tried hard to analyze this code but couldn't quite figure out whether an overflow could
>> actually happen... Maybe Alan (or Greg?) could please help me out?
> 
> All right.  Hold on to your hat...
> 

    :-)

>> static void reserve_release_intr_bandwidth(struct ehci_hcd *ehci,
>> 		struct ehci_qh *qh, int sign)
>> {
>> 	unsigned		start_uf;
>> 	unsigned		i, j, m;
>> 	int			usecs = qh->ps.usecs;
>> 	int			c_usecs = qh->ps.c_usecs;
>> 	int			tt_usecs = qh->ps.tt_usecs;
>> 	struct ehci_tt		*tt;
>>
>> 	if (qh->ps.phase == NO_FRAME)	/* Bandwidth wasn't reserved */
>> 		return;
>> 	start_uf = qh->ps.bw_phase << 3;
> 
> This guarantees that start_uf is a multiple of 8.

   I figured. :-)

>> 	bandwidth_dbg(ehci, sign, "intr", &qh->ps);
>>
>> 	if (sign < 0) {		/* Release bandwidth */
>> 		usecs = -usecs;
>> 		c_usecs = -c_usecs;
>> 		tt_usecs = -tt_usecs;
>> 	}
>>
>> 	/* Entire transaction (high speed) or start-split (full/low speed) */
>> 	for (i = start_uf + qh->ps.phase_uf; i < EHCI_BANDWIDTH_SIZE;
>> 			i += qh->ps.bw_uperiod)
>> 		ehci->bandwidth[i] += usecs;
>>
>> 	/* Complete-split (full/low speed) */
>> 	if (qh->ps.c_usecs) {
> 
> The fact that c_usecs is nonzero guarantees that we are dealing with a 
> full/low-speed endpoint.

   Ah! That's what I missed...

> High-speed transfers don't use split 
> transactions, so they don't reserve any bandwidth for complete-splits.

    Aha! I still lack the detailed enough knowledge of the USB 2.0 spec...

>> 		/* NOTE: adjustments needed for FSTN */
>> 		for (i = start_uf; i < EHCI_BANDWIDTH_SIZE;
>> 				i += qh->ps.bw_uperiod) {
> 
> It takes a little checking to make sure, but in fact bw_uperiod is always a 
> multiple of 8 for full/low-speed endpoints.  (Such endpoints don't make use 
> of microframes; everything is in multiples of frames, i.e., multiples of 8 
> microframes.)
> 
> Therefore i is always a multiple of 8 between 0 and 56 (inclusive), since 
> EHCI_BANDWIDTH_SIZE is 64.

   Aha!

>> 			for ((j = 2, m = 1 << (j+8)); j < 8; (++j, m <<= 1)) {
> 
> We always have 2 <= j < 8.

   BTW, why don't we start with 0?

> 
>> 				if (qh->ps.cs_mask & m)
>> 					ehci->bandwidth[i+j] += c_usecs;
> 
> Therefore 2 <= i+j < 56+8 = 64.
> 
>> 			}
>> 		}
>> 	}
>> [...]
>>
>>    There shouldn't be a buffer overflow iff qh->ps.bw_uperiod is a 
>>    multiple of 8, right?
> 
> Correct; see above.  To probe that qh->ps.bw_uperiod is always a multiple of 
> 8, search the driver for assignments to qh->ps.bw_uperiod.  (The only such 
> assignments occur in ehci-q.c:qh_make() --

   Yes, seeing them (again)...

> the assignments in ehci-sched.c 
> are all to stream->ps.bw_uperiod, and a stream is different from a qh.)  The
> first assigment is for high-speed endpoints and the second is for 
> full/low-speed endpoints.  That second assignment does:
> 
> 			qh->ps.bw_uperiod = qh->ps.bw_period << 3;
> 
> which is always a multiple of 8.

   Yes.

   Thank you for the prompt reply! :-)

> Alan Stern

MBR, Sergey
