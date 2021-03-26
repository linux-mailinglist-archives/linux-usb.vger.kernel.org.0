Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6FB34A252
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 08:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhCZHEw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 03:04:52 -0400
Received: from mordac.selfhost.de ([82.98.82.6]:51066 "EHLO
        outgoing.selfhost.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229812AbhCZHEo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 03:04:44 -0400
X-Greylist: delayed 395 seconds by postgrey-1.27 at vger.kernel.org; Fri, 26 Mar 2021 03:04:43 EDT
Received: (qmail 30878 invoked from network); 26 Mar 2021 06:57:52 -0000
Received: from unknown (HELO mailhost.afaics.de) (postmaster@xqrsonfo.mail.selfhost.de@87.160.241.83)
  by mailout.selfhost.de with ESMTPA; 26 Mar 2021 06:57:52 -0000
Received: from sylvester.afaics.de (sylvester.afaics.de [10.42.100.9])
        by mailhost.afaics.de (OpenSMTPD) with ESMTP id 2c37a5c5;
        Fri, 26 Mar 2021 06:57:52 +0000 (UTC)
To:     linux-usb@vger.kernel.org
From:   Harald Dunkel <harri@afaics.de>
Subject: 5.11.10: sync gets stuck after writing ubuntu live iso to usb stick
Message-ID: <1fd4daa4-ad11-51b2-6fc5-22d6213d551b@afaics.de>
Date:   Fri, 26 Mar 2021 07:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

using

	dd if=ubuntu-20.10-desktop-amd64.iso bs=64k of=/dev/sdx

on 5.11.10 to write a live iso to USB stick dd never returns.

lsof shows that the file handles for source and destination
have been closed, but dd doesn't exit. It cannot be interrupted
or killed, either. If I run "sync" in another terminal, then this
gets stuck as well.

I could reproduce this problem using Debian's 5.10.13-1 and
5.11.{9,10} built from the sources in git, on Debian 10 and
Unstable. I tried to copy the ubuntu live iso and the RHEL 8.3
installer iso. 3 different USB sticks.

There is no such problem using Debian's 4.19.0-16-amd64 kernel
on Debian 10.

Can anybody reproduce this as well?


Regards
Harri
