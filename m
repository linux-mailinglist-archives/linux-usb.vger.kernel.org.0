Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79B239F4BC
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 13:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhFHLQQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 07:16:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:49590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhFHLQP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Jun 2021 07:16:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9C4F6128A;
        Tue,  8 Jun 2021 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623150863;
        bh=78ccAhFO7kifF3RGq7XD9QjAw3FZnNAFHEg3c4q4Vr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wzcCpsPYYs3ePxgglZVbi7fWGbed0RVk7QwZsstAMyYLXBTVC1cChhk94eH52A0tC
         ze7ESOEINwVdaxMBos5Yth/2jhLL9184tKTevAc7Yb2JX9Hd1sGaH6qM++6mVp513D
         TFi9xOz1YUmQ9yfVYYEu+oltKmPFR+6YoLeSGiM8=
Date:   Tue, 8 Jun 2021 13:14:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Muni Sekhar <munisekharrms@gmail.com>
Cc:     linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: USB sound card issues
Message-ID: <YL9RDBUsk23LvHV9@kroah.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 04:20:07PM +0530, Muni Sekhar wrote:
> Hi all,
> 
> I am using a USB sound card(snd-usb-audio), and it fails while doing
> the audio recording "arecord: pcm_read:2032: read error: Input/output
> error".
> 
> What could be the problem? and is there a workaround for this?
> 
> $ arecord -l
> **** List of CAPTURE Hardware Devices ****
> card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> 
> $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
> Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error

What kernel version is this, and what other kernel messages are printed
when you plug your device in?

thanks,

greg k-h
