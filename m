Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01AEADF349
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 18:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJUQiN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 12:38:13 -0400
Received: from outgoing.selfhost.de ([82.98.87.70]:56846 "EHLO
        outgoing.selfhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbfJUQiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 12:38:13 -0400
Received: (qmail 30830 invoked from network); 21 Oct 2019 16:38:10 -0000
Received: from unknown (HELO mailhost.afaics.de) (postmaster@xqrsonfo.mail.selfhost.de@62.158.107.220)
  by mailout.selfhost.de with ESMTPA; 21 Oct 2019 16:38:10 -0000
Received: from cecil.afaics.de (cecil.afaics.de [10.42.100.186])
        by mailhost.afaics.de (OpenSMTPD) with ESMTP id 3443e968;
        Mon, 21 Oct 2019 16:38:10 +0000 (UTC)
Subject: Re: 5.3.6: I/O error on writing SD card via USB3
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.1910191052530.4534-100000@netrider.rowland.org>
From:   Harald Dunkel <harri@afaics.de>
Message-ID: <2fe6fc2e-d1da-8e74-221b-e750509832ef@afaics.de>
Date:   Mon, 21 Oct 2019 18:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1910191052530.4534-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On 10/19/19 4:57 PM, Alan Stern wrote:
> 
> What happens if you don't use that rather slow 133x SD card?  Do other
> cards work better?
> 

No problem with a 32 GByte SDHC card (U1).

> Another possibility: If you attach the card adapter by a USB-2 cable
> then it will run as a USB-2 device (even when plugged into a USB-3
> port).  That probably would help -- although it would also slow down
> the data transfers.  Although, come to think of it, slowing down the
> transfer rate may be just what this card needs...
> 

The USB2 cable worked, too. Actually I had expected that the speed is
reduced automatically according to the specs of the card. ???


Regards
Harri
