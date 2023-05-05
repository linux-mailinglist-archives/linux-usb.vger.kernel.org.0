Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 715B16F8607
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 17:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbjEEPmu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 11:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjEEPmt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 11:42:49 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5A71493A
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 08:42:48 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-763740a7f31so10860239f.0
        for <linux-usb@vger.kernel.org>; Fri, 05 May 2023 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683301367; x=1685893367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJ1JCWzleNVQG9TsUp5HbBlt/oMKIY13y1/3J7Q2wgM=;
        b=AubTYQfzEWmAwgX631PZCxEdsgMDMSqbI8++bXQExHLdxtlcWzCCF3ar9Y1PegwP3N
         lqUiRyO5ZSSuv+A9G9K+A7+Pwh5CeiHU7/bb+ffyegbGLC6bDuAAONBkBN7+R8YENz0u
         cogo3fnPbwVOVbZpGVoS2bVoCM5Sk55T1GtOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301367; x=1685893367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJ1JCWzleNVQG9TsUp5HbBlt/oMKIY13y1/3J7Q2wgM=;
        b=aSU7tKKHnWkNzoRWnS9fPAFbZjQpwm9WXeUFhSxotqaP65q0YSRIXjQlebhfEe1pji
         fBWcbVuFC2TU1CjEsxn/TzyvhLV3zL5N3YZzVag8WDwB9vO08lb/r4UJiMlnbVMxOpPA
         kclYmEVIO3pR0qJRHWnzof2tpJDLj0ExIRcab3bpg9diZcSMPBYM/n8YWNCOJKl5f1nh
         cGWJeIxdAJ3J6irnwYojI3uPeah6sTzajp/kfpa3KQSd8471kLVqlrOt3ni8NK2vwW8c
         S6HSF68D67mtm6tPA2gBzMJqePkhESRsGw777ZP9nTM5Bk82GDSodVlpiH7G3hZw1eNk
         EB4g==
X-Gm-Message-State: AC+VfDwNpKKvb/sVXR2u9ac8ZO58ApKgmMG+KrEOCsRjpWmnpD+tqFBx
        pkFdllPx5WsE0pSCWKk1hP6dIQ==
X-Google-Smtp-Source: ACHHUZ51yUvle1MGzTAOPoRzdG5nSc/SEU8nyOXWBOauodeHXwCsqMi08KtCoEp3ekCvHerZLxfcRA==
X-Received: by 2002:a92:cd8d:0:b0:331:30ac:f8fe with SMTP id r13-20020a92cd8d000000b0033130acf8femr1094067ilb.3.1683301367445;
        Fri, 05 May 2023 08:42:47 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id i17-20020a02cc51000000b0041650ca49casm26273jaq.83.2023.05.05.08.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 08:42:47 -0700 (PDT)
Message-ID: <59e51f1c-0e66-eca8-fa22-91bdce967897@linuxfoundation.org>
Date:   Fri, 5 May 2023 09:42:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_get_descriptor (2)
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+e8db9d9e65feff8fa471@syzkaller.appspotmail.com>
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mailhol.vincent@wanadoo.fr,
        mkl@pengutronix.de, syzkaller-bugs@googlegroups.com,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <000000000000fd3ea305f0644a0b@google.com>
 <000000000000c2922605faf2baeb@google.com>
 <aaf08c6d-b085-4755-afc1-98301106e947@rowland.harvard.edu>
Content-Language: en-US
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aaf08c6d-b085-4755-afc1-98301106e947@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/5/23 09:38, Alan Stern wrote:
> This appears to be related to the usbip driver.  At least, the console
> log is full of references to vhci_hcd.0.
> 
> Alan Stern
> 

Thank you. I will take a look.

thanks,
-- Shuah
