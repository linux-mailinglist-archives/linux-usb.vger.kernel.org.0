Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F08B8713013
	for <lists+linux-usb@lfdr.de>; Sat, 27 May 2023 00:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjEZWcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 May 2023 18:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjEZWcK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 May 2023 18:32:10 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15C6119
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 15:32:09 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-776f790de25so8449339f.0
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685140329; x=1687732329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9neysGGfncvfzLzl+KOCCQRQt1N0p92liqmG3pnjBa4=;
        b=P7e6n+k3NWRNc3P9WXjZhTfG32xkAL9WI4I7i6hyhNKYuIguwhP8rV6zwWaozWWoOd
         MIXcIausBnNDZNM8zUMKCMFibgbIV0tyfw5y5JLMBPjug8T2CgGDC+J7DFAjjCX1JAg/
         EJ3MO3xawKEKbC7AUABAIDU8hMuG+quHH225I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685140329; x=1687732329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9neysGGfncvfzLzl+KOCCQRQt1N0p92liqmG3pnjBa4=;
        b=cqm3r+9xjPIIGpZZivTGA5qDwqvpUEENuDatZLuZkQIiNxV9XQ5PBqrVwx/EkBVW3l
         hPF4uzq+4bAADeE9OzrhZLcxTWboo84CCKzziOxlCe3uQ051RqJ0mYD6z9n1BL1VcLkr
         0CcuzvdXsYq3ltxUXBP9oN/+6jqcbaDiJ7yCm8H0o6yetmmPsciLesk2IOiuKQmBcwXU
         JYaZCO3l3RUq5ivkP+qQ8gsrZX6U3tR+SACGAxYr1s9lZ6+5xhKbDzbrPkrgqROQLgDz
         U3NTU7pWc3NXCR860CtMPj+vlMguAYyPfmSuYmCekSJw9iMXG8PIvjPhq6brC6TtU6AM
         Sefg==
X-Gm-Message-State: AC+VfDxe6A1GJspxNeg5HjhKS7tbWMuuwq9pLGVBfIqBRWOWd7Kg3nhQ
        DNrxVQiYHTV4bZ8uytRC/a7WaQ==
X-Google-Smtp-Source: ACHHUZ4s/IWNyhIuGK6qBNt7xgf2a2b4ySe1sVzWsejeAY/36Hiz9jxNIKUh55drt20mZ7MnNhlk7Q==
X-Received: by 2002:a05:6e02:c6a:b0:331:30ac:f8fe with SMTP id f10-20020a056e020c6a00b0033130acf8femr1882723ilj.3.1685140329135;
        Fri, 26 May 2023 15:32:09 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id w24-20020a029698000000b0041844cb2c2dsm1352674jai.115.2023.05.26.15.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 15:32:08 -0700 (PDT)
Message-ID: <90e7ff3c-aaab-8427-7610-2a6d9229af14@linuxfoundation.org>
Date:   Fri, 26 May 2023 16:32:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [BUG] Potential race condition in usbip attach
Content-Language: en-US
To:     Alexander Timofeev <alex42timofeev@gmail.com>,
        valentina.manea.m@gmail.com, shuah@kernel.org
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <CAM82uABnohNw1Rv8q7qJi-WT9wXCuHyYV5w3++A_EeaodZr46A@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAM82uABnohNw1Rv8q7qJi-WT9wXCuHyYV5w3++A_EeaodZr46A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/24/23 11:48, Alexander Timofeev wrote:
> Hi!
> 
> Sorry if you have received this email twice. My first email contained
> html and was not accepted by the mailing list.
> 
> I think I have found a race condition which can be triggered for
> example when calling two usbip attach commands in parallel on the same
> host.
> 
> In file linux/tools/usb/usbip/src /usbip_attach.c:
> In function static int import_device(int sockfd, struct usbip_usb_device *udev):
> 
> At first two processes may call usbip_vhci_driver_open() before
> entering the do-while loop.
> Next they both call usbip_vhci_get_free_port() and get the same free port.
> Finally, they pass the same port number to usbip_vhci_attach_device().
> 
> Current recommendation to end users: run usbip attach commands only
> sequentially.
> 

Will you be able to share the reproducer?

thanks,
-- Shuah

