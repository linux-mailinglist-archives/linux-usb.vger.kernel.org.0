Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FDD3C9139
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 22:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241248AbhGNT7N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 15:59:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49837 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S242496AbhGNTz2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 15:55:28 -0400
Received: (qmail 391781 invoked by uid 1000); 14 Jul 2021 15:52:35 -0400
Date:   Wed, 14 Jul 2021 15:52:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hylke Hellinga <hylke.hellinga@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
Message-ID: <20210714195235.GG380727@rowland.harvard.edu>
References: <20210713184251.GC355405@rowland.harvard.edu>
 <CABUoX8sNbLuG0FB2_VtH14KhuBoRFB19a2V3cpgzdNDqiVUULA@mail.gmail.com>
 <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
 <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
 <20210714145423.GB380727@rowland.harvard.edu>
 <CABUoX8uUhW4bdUZ6Roo=jEn=3UwUq2QVAMPcnyg8rbLzua09=w@mail.gmail.com>
 <20210714180512.GF380727@rowland.harvard.edu>
 <CABUoX8vWDRtr4hiVOEkT48=doG8xbAVD65Hve0QByLJpV0JsqQ@mail.gmail.com>
 <CABUoX8uiYvDTcc8JvRk=T2n9Dr8ero+9dM1U7kh86_0f_U6rSw@mail.gmail.com>
 <CABUoX8sMSjHuq9awkJO8PcH07LQK9pEMRjxeuB2WghrMRUTuew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABUoX8sMSjHuq9awkJO8PcH07LQK9pEMRjxeuB2WghrMRUTuew@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 07:02:04PM +0000, Hylke Hellinga wrote:
> I think it definitely has to do with my linux distribution being messed up.
> 
> I just tried this on a ubuntu live cd with the same hardware, and I'm
> not experiencing any issues.
> I'll try to ask on the gentoo irc whether someone could help me figure
> out what is causing it.

There could be different versions of the kernel on the SSD and the 
LiveCD.

> Sorry if I've wasted your time.

No problem.

Alan Stern
