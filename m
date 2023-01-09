Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7466285C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 15:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjAIOWh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 09:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjAIOWg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 09:22:36 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34F912D30
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 06:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1673274147; bh=ksHe5B5Ef9+ZT9SMLYkJkZF9IzfGTou6b55tH6+8Iso=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=gXi7Z29rEQKlg1JAZ8BFlVrZFAPbajVXUSppGno20EyyULt0fg8mb6yVUmgJge2CT
         bbClaEdr26YgGNZblAXxuucX6ZXHE9ds9mnTlhCYQ75Wj9VLE+t2saqzOM3wF7hhU9
         tnmc1O7eA/qLBrYl2WWqlhCnEdybfqwxKMPQbEvTJPB8vfejhPXvcVL73lVASqvjao
         6+1JqOBmO+YSbj2e8PaVtFOGYm6esPIo/QXRatJWuOHkN2SSkq9fto/qUrFuuWFQ8m
         /5WHb2WpkRNevr9faK1s20zkR3enk1Mw9uUloklA+5yPVMIgc5fKl4WP8/7DpdKbzD
         QRFH9/m1qhHUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1p1fcp3C4W-00DJPg; Mon, 09
 Jan 2023 15:22:27 +0100
Message-ID: <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
Date:   Mon, 9 Jan 2023 15:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ZkxG7YNxCO/5bhEuxw7B6vBj2NrsjrQhN100DNG0B+MFCDkzCfo
 76fjk/h4b9J90tVB3z7GEBZULh6/lcSEsBOWX3CovgNVCLhWxgw/fXV+YvduDfEIZV3Io4X
 DAaqksVYGlZ/G/Q193vWIf3S8uhq0U6P2L1me0qjk/zyvIsxUkVPM2DjzxYKD3Q7Y1mkpBG
 KC5y8gfbTLrC+YVXRXTlw==
UI-OutboundReport: notjunk:1;M01:P0:dFUbShk8CUI=;Uecuasx6ZWi3M8GJUyxGMcpjWho
 +UbP5VTJyWrdsNuZTZtg9G+lT+IflWEBSxUa5P98wV5YFzCcWjLxaAHAk1MoAy7ri6K0bHMv4
 UgPye1WiFtEFmKJS2ct779YiJWoT2CfBvg8+1gEGm7absbtYyS0Zi7YJ4ZWAEAbuu8FRSLG1l
 FHybEwuT9Y2tACB45oov4tWrpk38sys89W6I0RCNQxt/A3j/XB2lpN7bVBtUooUK35r0iyYyr
 Pv218KyTa+RFKHJzEOE8pan8H1BSCb7VqLJwPIHQz0gIMgKjCXEIukxV3YUI3u9fwlOx0gYqP
 6Dt9RhsfbGsjuTRKR24f6IJkwLhsoIeKBQnRKwaWbR+f2hl+9zI7op/wpL+zS+Ul8RNYVxusY
 0Qui2ck32xO1fr0DYvQAWqn/1ilJTAk9uPGHJFMIRxViNHj76OVqb23z1LdfBlh4eFvVTamgK
 kOluR9sAlry2wXR4RSfHVesjPVT+FzgqGrLlak1/ge+kzVlZiw8LolwBexqZtd5vL0djtAEl8
 WE1OvG51a+C1lbczi4w0o6uwnu0zUg1+z1GXIQWpO4d6lMrGElTPPT9Xt67ThUoc/YlBaGirn
 3uEo4m8lpodkRARBjmFsZRp3rIsxSFRrlkYElwk8aVvjmdr9LnqVMWy99q5ODD1WRAoAnwJGC
 ppFqeobXVcxD6+9vQfBHqBuH+I55yD9ifF8x1GZA4pWvag0zZzvXgvwWQdSXGdtwKRhlPgv2Z
 INfSvGcZIYvSah/2MOlXMvN/Q8a3Kg4pNzdAJsHEO1yh/aLyZL/yw97NcuQUsXaQlA0wILL2m
 l6x9eXExBcsW0BOdPx/Qz3kf2drA+JW2ylbVzgq4bPJwOQFjLlqXlOqqkMEODINdHAQtpvO9S
 tyvviDh3IATmRuBwLKKhlYj4sjoJIDny3LtPDYyijcmZx0I6FFpiOKNjNMWtK9HCkOWC8BH3v
 UIOiKIeZuung2PNo7znofdOn3Bs=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> Okay it could be that Windows CM is doing something during the reboot,
> like resetting the ports. Can you try the below hack patch and see if
> that makes it work the same in Linux?

I'm afraid that doesn't make it work. I can see that usb4_port_reset is called 4 times when the machine is rebooted, but still the net device isn't there afterwards.

Christian

