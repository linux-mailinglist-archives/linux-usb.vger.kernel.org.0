Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E023141E9A
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 15:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgASOmk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 09:42:40 -0500
Received: from metropolis.steve-m.de ([78.46.204.175]:33756 "EHLO
        metropolis.steve-m.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASOmk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 09:42:40 -0500
Received: from [192.168.3.100] (p57AF1C03.dip0.t-ipconnect.de [87.175.28.3])
        (Authenticated sender: steve@steve-m.de)
        by metropolis.steve-m.de (Postfix) with ESMTPSA id 7C1E81A0041;
        Sun, 19 Jan 2020 15:42:38 +0100 (CET)
Subject: Re: Regression in 5.5.0-rc6 for FL2000 USB 3.0 to VGA adapter
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <9cadc6b9-16f7-e072-abee-53ac5c143198@steve-m.de>
 <20200119135811.GY2301@localhost>
From:   Steve Markgraf <steve@steve-m.de>
Message-ID: <734d9503-29ef-2fa0-5df8-6ef5701d3d61@steve-m.de>
Date:   Sun, 19 Jan 2020 15:48:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119135811.GY2301@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

On 19.01.20 14:58, Johan Hovold wrote:
> I just took a quick look at the libosmo-fl2k code and it appears that
> you claim both interfaces but never set alternate setting 1 for
> interface 0, which would enable those endpoints.
> 
> Could you see if that's all that's needed to get your application
> working again?

Yes, you are right, I had another look at it today and tried exactly
that, and it's working now with altsetting 1 of interface 0.
I will push a change to osmo-fl2k shortly.

There is also an out-of-tree kernel driver that makes use of this
device, and might even need interface 1, but I haven't verified this so
far:

https://github.com/FrescoLogic/FL2000

The question is if there are other devices out there where there are
duplicate endpoints on different interfaces. The spec clearly states
that this is forbidden, but the USBx0CV Chapter 9 tests do not test for
this and pass just fine, so I assume the FL2000 will not be the only
device in the market where this mistake has been made.

Regards,
Steve
