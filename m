Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BA1273D5C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 10:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgIVIeh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 04:34:37 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:63593 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIVIeh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 04:34:37 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08M8YLAq053035;
        Tue, 22 Sep 2020 17:34:21 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Tue, 22 Sep 2020 17:34:21 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08M8YKG6053020
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 22 Sep 2020 17:34:21 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC 0/5] fix races in CDC-WDM
To:     Oliver Neukum <oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200812132034.14363-1-oneukum@suse.com>
 <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
 <1599728957.10822.9.camel@suse.com>
 <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
 <1600161279.2424.5.camel@suse.com>
 <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
 <1600251486.2424.17.camel@suse.com>
 <4e724e07-3993-bcaa-79e9-45a2f7e1f759@i-love.sakura.ne.jp>
 <1600336214.2424.39.camel@suse.com>
 <0bd0995d-d8a0-321a-0695-f4013bbc88ec@i-love.sakura.ne.jp>
 <1600352222.2424.57.camel@suse.com>
 <52714f66-c2ec-7a31-782a-9365ba900111@i-love.sakura.ne.jp>
 <1600685578.2424.72.camel@suse.com>
 <fab1cbfc-7284-73f4-b633-1e060c38acdb@i-love.sakura.ne.jp>
 <1600759983.6926.9.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <94896ccd-e1b3-11c5-be98-954ee01081ac@i-love.sakura.ne.jp>
Date:   Tue, 22 Sep 2020 17:34:16 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600759983.6926.9.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/22 16:33, Oliver Neukum wrote:
> Am Dienstag, den 22.09.2020, 10:56 +0900 schrieb Tetsuo Handa:
>> On 2020/09/21 19:52, Oliver Neukum wrote:
>> To understand it, I must understand why it is safe to defer error reporting.
> 
> It is not. There is nothing to understand here. If user space needs
> a guarantee that data has been pushed out without an error, it will
> have to call fsync()

>> I'm querying you about characteristics of data passed to wdm_write().
>> Without knowing the difference between writing to cdc-wdm driver and normal file on
>> some filesystem, I can't judge whether it is acceptable to defer reporting errors.
> 
> That is simply not a decision you or I make. The man page clearly
> says that it is acceptable. If user space does not like that, it must
> call fsync() after write().

Then, cdc-wdm driver did not implement fsync() was a big problem. Userspace
needs to be careful not to give up upon -EINVAL when running on older kernels
which did not implement wdm_fsync().

The remaining concern would be how to handle unresponding hardware, for blocking
wdm_write()/wdm_read() and wdm_fsync() are using wait_event_interruptible(). If
the caller do not have a mean to send a signal, the caller might hung up forever
when the hardware stopped responding. Please add a comment that userspace needs to
be careful when calling these functions.

