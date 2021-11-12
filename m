Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8EC44EB03
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 17:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235271AbhKLQHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 11:07:47 -0500
Received: from dynamic-077-001-167-197.77.1.pool.telefonica.de ([77.1.167.197]:51746
        "EHLO vacharakis.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhKLQHr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 11:07:47 -0500
Received: from [192.168.1.209] (router.lan [192.168.1.1])
        by vacharakis.de (Postfix) with ESMTP id 9B5AB3C3B5B;
        Fri, 12 Nov 2021 17:04:54 +0100 (CET)
Message-ID: <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
Date:   Fri, 12 Nov 2021 17:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Content-Language: de-DE
To:     Alan Stern <stern@rowland.harvard.edu>
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
From:   DocMAX <mail@vacharakis.de>
In-Reply-To: <20211112154052.GB32928@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It has it's own 60 watts power adapter. I doubt a usb-c port can power 4 
x 3,5 inch hdd drives?

It's this enclosure by the way:
https://www.fantec.de/en/products/storage-devices/ssd-hard-drive-cases/35-inch-hard-drive-cases/produkt/details/artikel/1695_fantec_qb_35us3_6g-1/


Am 12.11.21 um 16:40 schrieb Alan Stern:
> Does this device have its own power source, or does it run off power
> from the USB bus?  This kind of error is fairly common when a drive
> adapter doesn't have enough power.
>
> Alan Stern

