Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109C253D5A6
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 07:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbiFDFcI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jun 2022 01:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiFDFcH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jun 2022 01:32:07 -0400
Received: from mail.toniclab.ru (unknown [194.187.149.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE8865B0
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 22:32:00 -0700 (PDT)
Received: from post.toniclab.ru (localhost [127.0.0.1])
        by mail.toniclab.ru (Postfix) with ESMTPSA id BA232154F65;
        Sat,  4 Jun 2022 08:31:56 +0300 (MSK)
MIME-Version: 1.0
Date:   Sat, 04 Jun 2022 08:31:56 +0300
From:   Yuri <info@toniclab.ru>
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: /dev/ttyUSB0 file disappears on Ubuntu 22.04
In-Reply-To: <Ypmt2EdQIvTmKEyW@kroah.com>
References: <4b9e024d14c40cba7c04d5879ae64866@toniclab.ru>
 <YphShbNo8cTU65Qj@kroah.com> <6391aa3d842029344835b4b085390a2e@toniclab.ru>
 <Ypmt2EdQIvTmKEyW@kroah.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <e663ff3440913f0465264063151bb3a1@toniclab.ru>
X-Sender: info@toniclab.ru
Organization: TonicLab
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=3.4 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        MAY_BE_FORGED,RCVD_IN_PBL,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> 
>> ls: cannot access '/dev/ttyUSB*': No such file or directory
> 
> Is the device node actually there?
> 
> What does /dev/serial/ contain?
> 

After I have a ftdi device attached I have

cd /dev/serial ; ls -LR

.:
by-id
by-path

./by-id:
ls: cannot access './by-id/usb-FTDI_USB_Serial_FT0KKBIF-if00-port0': No 
such file or directory
usb-FTDI_USB_Serial_FT0KKBIF-if00-port0

./by-path:
ls: cannot access './by-path/pci-0000:00:1d.0-usb-0:1.5:1.0-port0': No 
such file or directory
pci-0000:00:1d.0-usb-0:1.5:1.0-port0

So the folders and links are there but there's no /dev/ttyUSB0 file

>> No problems on the same PC working under Ubuntu 18.04 and 16.04 
>> whatsoever:
>> 
>> ls -l /dev/ttyUSB*
>> crw-rw---- 1 root dialout 188, 0 Jun  2 10:36 /dev/ttyUSB0
> 
> I think you are going to have to contact ubuntu for this issue and get
> support from them as it's their kernel and overall system configuration
> here, the kernel looks like it is working just fine.

Thanks for advice. Already opened a bug report on launchpad.
