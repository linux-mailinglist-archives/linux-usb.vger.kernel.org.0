Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06C42E08FA
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 18:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389472AbfJVQeK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 12:34:10 -0400
Received: from outgoing.selfhost.de ([82.98.87.70]:36291 "EHLO
        outgoing.selfhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389468AbfJVQeJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 12:34:09 -0400
Received: (qmail 16305 invoked from network); 22 Oct 2019 16:34:06 -0000
Received: from unknown (HELO mailhost.afaics.de) (postmaster@xqrsonfo.mail.selfhost.de@62.158.107.220)
  by mailout.selfhost.de with ESMTPA; 22 Oct 2019 16:34:06 -0000
Received: from cecil.afaics.de (cecil.afaics.de [10.42.100.186])
        by mailhost.afaics.de (OpenSMTPD) with ESMTP id a263e3c3;
        Tue, 22 Oct 2019 16:34:06 +0000 (UTC)
Subject: Re: 5.3.6: I/O error on writing SD card via USB3
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.1910211339170.1673-100000@iolanthe.rowland.org>
From:   Harald Dunkel <harri@afaics.de>
Message-ID: <8b9b00f1-aec6-5c38-064a-83c04c8b1a9e@afaics.de>
Date:   Tue, 22 Oct 2019 18:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1910211339170.1673-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On 10/21/19 7:48 PM, Alan Stern wrote:
> On Mon, 21 Oct 2019, Harald Dunkel wrote:
> 
>>
>> The USB2 cable worked, too. Actually I had expected that the speed is
>> reduced automatically according to the specs of the card. ???
> 
> That is doubtful.  The speed of the connection is determined when the
> connection is first set up.  Unless the reader disconnects itself from
> the USB bus when a card is removed and reconnects when a card is
> inserted, the speed can't change.
> 
:
:
> 
> At any rate, it sounds like the 133x card is just too slow to keep up.
> 


AFAIU the SD card is accessed similar to other block devices. There shouldn't
be any I/O errors on writing to a slow device, unless hardware or software are
faulty. The data to write is cached.

Anyway, I got a new USB3 card reader today: No problem with it, even though
I wrote to the same slow SD card. Since the old SD card reader works OK using
USB2, I would either assume a bug in the XHCI driver for the old device, or a
hardware failure.

Would you agree to this conclusion?


Regards
Harri
