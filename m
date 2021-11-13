Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F27C44F552
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 21:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbhKMU7x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Nov 2021 15:59:53 -0500
Received: from dynamic-077-010-127-206.77.10.pool.telefonica.de ([77.10.127.206]:46160
        "EHLO vacharakis.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbhKMU7x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Nov 2021 15:59:53 -0500
Received: from [192.168.1.166] (router.lan [192.168.1.1])
        by vacharakis.de (Postfix) with ESMTP id F25693C34FC;
        Sat, 13 Nov 2021 21:51:35 +0100 (CET)
Message-ID: <b8cafa49-62f4-ffd0-0bdf-7c5cfcee6150@vacharakis.de>
Date:   Sat, 13 Nov 2021 21:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
 <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
 <20211112175150.GA37212@rowland.harvard.edu>
 <31548846-8ff4-9297-10b3-4f543ee0a5e0@vacharakis.de>
 <20211112204957.GA39387@rowland.harvard.edu>
 <143be825-7480-db76-46c4-e5e0d332e98a@vacharakis.de>
 <20211113154644.GC58521@rowland.harvard.edu>
From:   DocMAX <mail@vacharakis.de>
In-Reply-To: <20211113154644.GC58521@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry i'm not into coding very much. Can't do this task.
But i guess it will work if it does the same i did with the kernel 
command line.

I don't know a single working UAS device for linux. (With 4 bays minimum).

On 13.11.21 16:46, Alan Stern wrote:
> Can you verify that the patch does fix the problem?
