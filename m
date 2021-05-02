Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8AD4370DA4
	for <lists+linux-usb@lfdr.de>; Sun,  2 May 2021 17:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhEBPa3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 May 2021 11:30:29 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58781 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230110AbhEBPa3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 May 2021 11:30:29 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 May 2021 11:30:29 EDT
Received: from cust-57f2be97 ([IPv6:fc0c:c196:c6c4:fdf1:aa47:ab6:e251:d2a8])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id dDvSlLPxXyEWwdDvTlheGU; Sun, 02 May 2021 17:22:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619968951; bh=bGHZ8wBTsZevj5kR6lSVeGgrehn8Iv3V4ofD4z59OOE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Kc14Gpz5gttDFsX7eF9XH5D9/jL/eUnfx1eOFb30ROtX7/J/i4JOCuXdYU4TKixv9
         ETXEHz82wC7ZzlpqimlGJITuyb8L4XNsrCR+M6RBu/7wmSCrI9oTLquiitmmRVb7jI
         fgodr2YVQ2w8ea424huV8dctke7VBVCE6PSAVMV0/5SsqYVCoAobW+ygnnIAIUaH7h
         FF4WEjEVaxk1FtSctRcuyoIlSpD6VdSl1C2ihdjZ9NAUdwvg3isoTZeqqsX4bW2CaG
         WFLaJ2Ma6ZWExFUz8JQ9nQiw6MySrdWP08Vw9iS7xUyLsxWBKx11JXYcqDJ1nClh5n
         CYEyroJuKSW0A==
To:     USB list <linux-usb@vger.kernel.org>
From:   Udo van den Heuvel <udovdh@xs4all.nl>
Subject: 5.11.17: xhci_hcd 0000:0a:00.3: WARN Event TRB for slot 3 ep 12 with
 no TDs queued?
Organization: hierzo
Message-ID: <18f75805-2538-476f-38bb-d3c6e1c2bf5e@xs4all.nl>
Date:   Sun, 2 May 2021 17:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHpxc+oOJR05jbXQDyjljlqh0l/sKJCxPICC4Hc2J4BYllDsaKpmXRx8hE38yVbwHOxEOapfdGV4PSUtHvgqjc8MKZBlHJrd6wjQU9UNVv01RmjdSrFB
 Hxumbg23o7dSaWJLaeL/LWs4QS+xii4khLer0ipq2imNf15G5uPpzmyMW1zXxy7y0/OC34uYKfi5RIUibU6FSjCtvabDcjF0Z3jCVmDjzkumgHd5W1oHM9d2
 u5lwWid+/BN3cffkfXqqEw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

When 5.11.17 gives me a load of:

xhci_hcd 0000:0a:00.3: WARN Event TRB for slot 3 ep 12 with no TDs queued

What happened?
What can I do (to help) fix it?


Kind regards,
Udo

PS:

AMD Ryzen 5 3400G with Radeon Vega Graphics on Gigabyte X570 AORUS PRO 
running kernel.org w/ Fedora 34.
