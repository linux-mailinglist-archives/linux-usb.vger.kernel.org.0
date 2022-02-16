Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB934B84F6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbiBPJxj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:53:39 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbiBPJxi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:53:38 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4117316AA70
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:53:20 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id o6so2449621ljp.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Zh+UK3xgjO5SoOMhPZUkkx32vK2cN4Br44t/LBsUUs=;
        b=Pa5nylMuOEN9v7R5r1CHEkJx+eQHb59NATsfiOTPpXO0xXH5fwRe3SvRpd5dXifIq/
         WkGoXj+sW/9pbMmyizTR5gybBrs/EoxsWG5v8mV6DgR9VlGqejMPEOBreOz02rBqJOIS
         3RIud1AmZBAAv5ut2yootmTphYTkv54BaWbbn74VJTekE4Uk91og8Kj5h7s6jOVLD71s
         ZkLwEWODxkM97L0epmjkHkQcmTECk5MIf1CgJ42hRUhEfH9ViQAGTDY4qaD6BXrtFUC8
         s1FWybV7/TYBYg/IB+smDK1S2XzkV+KwKfOICqwesWqofflLaIt9T5JmUZSGB6CB30Dw
         RoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Zh+UK3xgjO5SoOMhPZUkkx32vK2cN4Br44t/LBsUUs=;
        b=KOUJPAbJq53N0Prz9Tn2MwtmUBCol0HeDy3udv3LcDyFgcRX2cBT09iiDeA5eia00u
         wgdnzyFMUBcFBMPKGcytiw7q4XjdtKdc55/q3wYiw9yLj4caBxd9NqFsNOa+BLIMnYWQ
         Fqdf9wVxZjWvOowvBShGXyVl6H0sPqHW/12YtwlMlXA50OJOMn8PNQlo9aO9+gkpTyNq
         Vy6eQaKTxyO93dDQaS0/QDHXFyoqnYEfAzg6mPf6eqVSyczP/djByINYt3kdLpsPGUVZ
         XYlgvLSRiSBUFhEd23B2YrUhldv9nWH7ycu8cqIia18XQNwTXJrH8btW69a9iArQte4a
         2gYQ==
X-Gm-Message-State: AOAM531tdc0bQ0weG2E0iq8z19Y88/g0s6z9J3w0kbqu1qwGLbsBQQ6q
        oJr8t+g7NyNBOz30l3KVZAA=
X-Google-Smtp-Source: ABdhPJxKsQzpCzi70RPLybFkz0itadVmX7T3tu+Kqun5s3ZiVol3i5fiNAVLBg5345tK+SdgtmZklw==
X-Received: by 2002:a05:651c:1784:b0:243:d87d:445a with SMTP id bn4-20020a05651c178400b00243d87d445amr1453331ljb.522.1645005190173;
        Wed, 16 Feb 2022 01:53:10 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.81])
        by smtp.gmail.com with ESMTPSA id s2sm1180582lfi.90.2022.02.16.01.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 01:53:09 -0800 (PST)
Subject: Re: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
References: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
 <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
 <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
 <DM8PR02MB819861F71713D5539EF66D12E3359@DM8PR02MB8198.namprd02.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c6cf661b-b3df-281f-3cb0-8899c95f9ce2@gmail.com>
Date:   Wed, 16 Feb 2022 12:53:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <DM8PR02MB819861F71713D5539EF66D12E3359@DM8PR02MB8198.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/16/22 12:47 PM, Linyu Yuan (QUIC) wrote:

> that's correct,  from my view, one line is good,
> 
> What's your suggestion ? two lines ?

   Yes, and it is not just my suggestion -- it's the kernel coding style.

[...]

MBR, Sergey
