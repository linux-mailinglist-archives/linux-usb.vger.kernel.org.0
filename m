Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C6E3754EC
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 15:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbhEFNjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 09:39:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54126 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbhEFNjs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 09:39:48 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64E0489D;
        Thu,  6 May 2021 15:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620308328;
        bh=roGvWAWoVT76ObVAAMmlenqKBKray4yS6l4tPGsH6Ao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UD79tKTluA/3gAd35wjtjflTkbv5Hn7WtihNvdlMpjkupYko86tepnxHcOrteyoWE
         rET/tuDjY9sUGKhQ+2AtdVj7Rvj2eTeLsoeiT/8G1GAe05nxqyrJ5XbJ3/PAigSnMh
         C5FeGDHH++Oz6X3qCXrj1SI+T9CT9dqNhYX5Z6xE=
Date:   Thu, 6 May 2021 16:38:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
Message-ID: <YJPxY55h8c4bBsBQ@pendragon.ideasonboard.com>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <YJPJ3aKf9BdQ8UKx@kroah.com>
 <CB675UH9U35P.3SQ8NI93618E5@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CB675UH9U35P.3SQ8NI93618E5@arch-thunder>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 06, 2021 at 02:29:14PM +0100, Rui Miguel Silva wrote:
> On Thu May 6, 2021 at 11:50 AM WEST, Greg Kroah-Hartman wrote:
> > On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> > > The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB controller.
> > > There is already support for the isp1760 and isp1761 in tree, this series extend
> > > the support also for the isp1763.
> > > 
> > > Move register access using regmap, remove some platform data and code, refactor
> > > the mempool, use dr_mode to align to existing bindings, then add the support for
> > > isp1763 host mode, add bindings files that did not existed and at the end
> > > add also support for peripheral mode for isp1763.
> > > 
> > > @Laurent and @Sebastian, I add both of you in the bindings files as maintainers
> > > (it is a mandatory field)since you were the ones which contributed with the
> > > initial code and peripheral code, let me know if you are ok with it.
> > > If yes I may send a follow up to add also entries in MAINTAINERS file that it is
> > > also missing.
> >
> > First 3 patches now applied, feel free to rebase and resend the rest
> > based on the review comments.
> 
> Thanks, yeah, I was taking the chance to clean all the pre-existing
> sparse warnings in that driver, since this was triggering some new
> ones.
> 
> And I knew that you merging this first ones would make Laurent jump
> from his chair and review this, eheh. Thanks for that also.

You've planned it together, haven't you, you naughty scoundrels :-D

> I will rebase and send follow up series that will address all
> that sparse warnings.

-- 
Regards,

Laurent Pinchart
