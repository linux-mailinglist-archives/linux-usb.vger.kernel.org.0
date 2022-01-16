Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC2448FDA8
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jan 2022 16:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235505AbiAPPhY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jan 2022 10:37:24 -0500
Received: from mail.he1.boomer41.net ([178.63.148.114]:56734 "EHLO
        mail.he1.boomer41.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbiAPPhX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jan 2022 10:37:23 -0500
Message-ID: <54698087e7d74fdb00af86ffec74997916e7994a.camel@stephan-brunner.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stephan-brunner.net;
        s=mail; t=1642347438;
        bh=RLCxLHSmwUdQHhBcIZ6Xj9H9M/puPlUHWw1g6JrpM94=;
        h=Subject:From:To:Date:In-Reply-To:References;
        b=a66HAPmGbsH2IJl0Z4065jol0AcW6Sz739ALfQ2cSZ4obcOgHfXKFYZc1c25e8YKU
         KjsMXHvJbG0E/zoHgZ0Vo6g4qmxPyjAuxP4fpfqtjqjlJxJBtGYwPeY85cydrq1yxR
         RI8AlitWd2Mhh1ttotvt2tCvoCLNlYgc5YqvNpL/SfwVymMHJVBH5aAhqp0mjLnaAR
         3rgw2XxfJmu6pKB0ipIB+w4LRKeQkWQvAA+oBVzv9xwxYW/l0VmsrZdRM7NJMBqWUc
         haTa6YNoHjNdz3TCjwDjJmuWa8OEsZALIYQb+gIuAeDWnjpzhFWt4ARYjRUs6mg42R
         MK3dHfI3u44+QWbrW7haBj5zLgRmnLhIn1LniuqADaUWL2NbfOQyDgckOA1RwUMjc1
         tiQMKh93ukTRbdD+H3GNTLGGnSO8NL7o4u4A93ZV6rbwAah9ReN3aA69lXot5be0to
         RI/Aw9u94pdO9/pDh1+eomzJiyrV2R7U6daMlZK3B+S+nu7kdJ1NAxa2QcRIJm2niN
         COqVc2ij2adRRwBebHnpmU2x+IJQ2j/j36lR2S0HBDEAMG1tLEfW7LtHkzV37ZMGqM
         UtFX/Uf/ZZ5VWWlSikfQvGiMMlptaymlBka6b8RLoUL5qYgtuF0lkjtESZF96h7b/W
         KWQgaLN8YudqMNx5eQIISA44=
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
From:   Stephan Brunner <s.brunner@stephan-brunner.net>
To:     Rajaram Regupathy <rajaram.regupathy@gmail.com>,
        linux-usb@vger.kernel.org
Date:   Sun, 16 Jan 2022 16:37:21 +0100
In-Reply-To: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

where's the license? Can't find one.

-Stephan

Am Sunday, dem 16.01.2022 um 20:49 +0530 schrieb Rajaram Regupathy:
> HI
> 
> libtypec
> ++++++
> 
> USB-Type C and USB Power Delivery systems are with multiple
> specification versions, platform designs and microcontroller vendors
> for managing  data, power and display.
> 
> libtypec is aimed to provide a generic way for userspace System
> Software on Linux, Android, Chrome OS or Other OSes to build
> developer
> tools or
> other management applications for USB-Type C and USB Power Delivery
> class devices.
> 
> Features
> ======
> - libtypec - get method for port and port-partner capabilities
> -  utils/lstypec -  displaying information about USB typec class
> devices in the system and the devices connected to them
> 
> Release:
> =======
> 
> Binary :
> https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec_v0.1/libtypec_0.1.tar.xz
> Source :
> https://github.com/Rajaram-Regupathy/libtypec/archive/refs/tags/libtypec_v0.1.tar.gz
