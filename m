Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B97944EC8E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 19:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbhKLSY3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 13:24:29 -0500
Received: from dynamic-077-001-167-197.77.1.pool.telefonica.de ([77.1.167.197]:35100
        "EHLO vacharakis.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235331AbhKLSY1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 13:24:27 -0500
Received: from [192.168.1.209] (router.lan [192.168.1.1])
        by vacharakis.de (Postfix) with ESMTP id 250A33C38D6;
        Fri, 12 Nov 2021 19:21:35 +0100 (CET)
Message-ID: <31548846-8ff4-9297-10b3-4f543ee0a5e0@vacharakis.de>
Date:   Fri, 12 Nov 2021 19:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Content-Language: de-DE
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
 <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
 <20211112175150.GA37212@rowland.harvard.edu>
From:   DocMAX <mail@vacharakis.de>
In-Reply-To: <20211112175150.GA37212@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The first and more buggy maybe.
So you are not going to fix this just blacklist uas by default?
I was so happy that i got a uas capable device and now the joy is 
over... :-(

Is there detailed information of the uas/usb-storage differences? (Very 
detailed, not just "it's faster")


On 12.11.21 18:51, Alan Stern wrote:
> Wow.  Judging by the serial number values, you got the first four
> devices of this sort ever made.  (That is, unless they use the same
> serial numbers on all of their devices!)
>
> Anyway, the patch below should accomplish the same effect as the
> module parameter override you've been using.  Let us know if it works
> properly.

