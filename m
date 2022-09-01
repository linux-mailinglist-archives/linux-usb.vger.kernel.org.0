Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8025AA38A
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 01:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiIAXO0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 19:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbiIAXOX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 19:14:23 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5607C32A
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 16:14:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v26so861045lfd.10
        for <linux-usb@vger.kernel.org>; Thu, 01 Sep 2022 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=soZe33lENWxiQfWnUb8rFmt1gciGa3few/PDkKqWJgk=;
        b=Q9NSFUlKmJ4Tynyu3mbmhTQJzKGpEguIwnWBqC3h+f2/JPqnyP8NIsdr2PUAONuJnH
         qDDKM0OwqigCYuuvKBhka6ZRigp7FQ2Xtoka7iFbMLi97ca8ookPnbRgXUu0gWRDdODI
         7SV5pUkx8SYYRsHzzOKc/T0iEwuA5/mp9i80AUfhptdBAf9h1RfGMPryyPfX/vG1ZPth
         oazI1k9sW/BYolcBIQT7XYlWQv8Us5PTpf+JkxvJ/vRP4AypZfnwhezd6Uu3ZE+mMsMr
         Tny+SQB0OJHKtciTBab0FJIOOML64wahaHo2lPvnIePTRXJ0CDiSLukE5SjnhAHPn6iI
         Qigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=soZe33lENWxiQfWnUb8rFmt1gciGa3few/PDkKqWJgk=;
        b=7lRkS230gCn7AkTLrP78J2WMWsOfH5p4y3/W8RCKHtAIRYqGxg/x9UZz/3eiMcHsvT
         rbjHguH4OsZRS1nNBnKhQ4wdjlA4gr+gIsIWFpSeeV1OeDXqBZJtNjbL69+vyi+M+r2b
         6x0Kpc0ajtPOqcaxdA+aY7gNngPEF2OSuV2qIRPEvlleuBGAJnEqXXMzf+VDStdsdbvn
         HNbAGwaepVD05YIX0tnzmHO421PgzrYZl7v/D2+4yL3PvyE9eLzV54cqAwciwEJ40HpE
         ceotsipy9PI9JVxJhXmEio6Hah7N9BzbrN5oitT2CY9aBteSSl6nbq+ZH72rEcLFeArQ
         Egyw==
X-Gm-Message-State: ACgBeo2v6Nw8Moi31FHQegYZQrhzZFYSmIsQKxAOFcD2ugLomk5CxdE3
        /YOI8DVZnNtSDRwcoyn1hxrLELKERUE=
X-Google-Smtp-Source: AA6agR4KSWVq931GCShb/cS8MQU9EjwEgM9RbZZ6Kmc8p9NCvzBuAUuXQpwnvUQ2M3diZ5YauNCOLA==
X-Received: by 2002:a05:6512:1309:b0:492:e273:d800 with SMTP id x9-20020a056512130900b00492e273d800mr10746240lfu.93.1662074061108;
        Thu, 01 Sep 2022 16:14:21 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id 10-20020ac25f4a000000b00492e4c97ca3sm30084lfz.246.2022.09.01.16.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 16:14:20 -0700 (PDT)
Message-ID: <36709b7c-d1b7-f81f-1ff5-c3743590fe35@gmail.com>
Date:   Fri, 2 Sep 2022 02:14:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Cleaning up bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
 corruption")
Content-Language: en-US
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
References: <78712d64-7bac-cc2f-4a99-52e35d12f46f@suse.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <78712d64-7bac-cc2f-4a99-52e35d12f46f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

29.08.2022 16:10, Oliver Neukum пишет:
> Hi,
> 
> I am looking at that patch and I am afraid, while it does the job
> it is quite unclean. In effect you introduce a flag you set, but
> never clear. That is just a kludge. It really tells you that your
> setup of data structures is misplaced and you should just do it earlier.
> 
> Could you test the attached patch?
> 
> 	Regards
> 		Oliver

That certainly won't work because phy-fsl has nothing to do with the
original problem. You'll need to check carefully every USB controller
driver. It's just not very worthwhile to do, IMO.
