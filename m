Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1DDC27C235
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgI2KS3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 06:18:29 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50741 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgI2KS3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:18:29 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08TAI50L044488;
        Tue, 29 Sep 2020 19:18:05 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Tue, 29 Sep 2020 19:18:05 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08TAI5vq044482
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 29 Sep 2020 19:18:05 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
To:     Oliver Neukum <oneukum@suse.com>, Greg KH <greg@kroah.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200922112126.16919-1-oneukum@suse.com>
 <20200925151103.GB3173449@kroah.com>
 <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
 <20200925152832.GA3191454@kroah.com>
 <c82c8fda-e9a1-ec70-21b1-761f75be5a43@i-love.sakura.ne.jp>
 <20200926054032.GB631346@kroah.com>
 <18932c4871b63a5a1f86cf9b820b3d5401464281.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <ddaecf81-de4f-ae45-2592-5f3ce21c65cf@i-love.sakura.ne.jp>
Date:   Tue, 29 Sep 2020 19:17:57 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <18932c4871b63a5a1f86cf9b820b3d5401464281.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/29 17:46, Oliver Neukum wrote:
>> That seems reasonable, then put Oliver's address on the first line with
>> a "From:" line to make this all work correctly when I apply it.
> 
> Hi,
> 
> I did sent out the series with a PATCH label last week.
> Should I resend?
> 

No need to resend. I already sent a squashed version as
https://lkml.kernel.org/r/20200928141755.3476-1-penguin-kernel@I-love.SAKURA.ne.jp .
