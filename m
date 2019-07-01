Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4B21381F
	for <lists+linux-usb@lfdr.de>; Sat,  4 May 2019 09:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfEDHa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 May 2019 03:30:58 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38944 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfEDHa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 May 2019 03:30:58 -0400
Received: by mail-pl1-f195.google.com with SMTP id e92so3805885plb.6;
        Sat, 04 May 2019 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EwweiBCfeJ/cKJj/kqdEZt5KyrfkU7tGiFKFsGG/ynM=;
        b=ge81vD4ktejLRqGTFd9opeJ/bQJ81OT/HtLTZzaN081dOnSgLk/b4K2qCWI3DuNOFL
         hfc4X2tNsk30NvPs1jLB+XcdWr20To+HKWCNte0d21hYM1a1a3ttIoQiVLyjK5uLvCxa
         oTMnOHFyaCUcu/vlLC+M1HGJnrERA1RECs9fwpDdoE60z3e16wsUl42bRcglYlOSKszs
         eMeuMwtXjpPLHTUCkZfhYQZ5sbBS//NQ9P3FMM3GVL5EKiucHHGacmZT3j9U8Znnlcyq
         LWl3+W5m//QptC1QEeeWS73cG4dRjlK94XBzIDJ5oXfwDlnwtOIu5KfjbTkVD5xBBC1Z
         4l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EwweiBCfeJ/cKJj/kqdEZt5KyrfkU7tGiFKFsGG/ynM=;
        b=iZZKs1gOGgDXJ8tUZ9GQlpebNb+0uqHRZ4jjug/8Qg0GaW8opuuXjB/M3bLPrdLQ1P
         yMXDKBem3JXgMlokH5Mr9Y6JX2v8EUnVJkQjanI5RcAOHcKmxgUhiCX0T+/qSjESrv6u
         Fb0KGLVgEBtyV7qfr8oRQa1Nfu3++/4q/A2wrGxVSYHTNlftJTG+Bke0bOSVyq/47LBS
         pRUXIb3fSq0zIVAf2N10APx+pBd/21wNadI8zPPnofGXCcb0mRtuTlwHLKYNKouS3b91
         vA0dFEX3Iy5YHfEYwGWGkkt+76AtqGIoOXfp+Vg92py8/e11ZI9OUzswIyneawKtKx/m
         foGA==
X-Gm-Message-State: APjAAAU8h27rtCdSZfE3wczdSrW/i6jpdwsDVIOHAUpC4wn1hIqfVlr6
        YMZGn5tJCDnocs4Yys4In58zcK/t
X-Google-Smtp-Source: APXvYqwQuHJjllCV9Zt2vI8TIT03UGNOh62eAd7zsJvPGi1g80RArlbgZHfIrLj+U/y4d+XrSyu0jg==
X-Received: by 2002:a17:902:2702:: with SMTP id c2mr16524210plb.277.1556955057920;
        Sat, 04 May 2019 00:30:57 -0700 (PDT)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.71.43? ([2402:f000:1:1501:200:5efe:a66f:472b])
        by smtp.gmail.com with ESMTPSA id j6sm5711397pfe.107.2019.05.04.00.30.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 00:30:56 -0700 (PDT)
Subject: Re: [PATCH] usb: host: xhci_debugfs: Fix a null pointer dereference
 in xhci_debugfs_create_endpoint()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190504033748.17964-1-baijiaju1990@gmail.com>
 <20190504063340.GA26311@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <db68433e-d655-217a-4a73-4bb83069addc@gmail.com>
Date:   Sat, 4 May 2019 15:30:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190504063340.GA26311@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2019/5/4 14:33, Greg KH wrote:
> On Sat, May 04, 2019 at 11:37:48AM +0800, Jia-Ju Bai wrote:
>> In xhci_debugfs_create_slot(), kzalloc() can fail and
>> dev->debugfs_private will be NULL.
>> In xhci_debugfs_create_endpoint(), dev->debugfs_private is used without
>> any null-pointer check, and can cause a null pointer dereference.
>>
>> To fix this bug, a null-pointer check is added in
>> xhci_debugfs_create_endpoint().
>>
>> This bug is found by a runtime fuzzing tool named FIZZER written by us.
>>
>> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> Very rare case, but nice fix.  You should put "potential" in your
> subject line as this is something that no one should ever hit :)

Okay, Greg, thanks for this advice :)


Best wishes,
Jia-Ju Bai
