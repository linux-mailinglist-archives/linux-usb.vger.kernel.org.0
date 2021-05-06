Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4FF3753CA
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 14:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhEFM0i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 08:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhEFM0h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 08:26:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D84C061574;
        Thu,  6 May 2021 05:25:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11D6D4A5;
        Thu,  6 May 2021 14:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620303936;
        bh=mTtfC2qPQLCL+oWLqMLa3aBPTZNOAaQfQRilk4nVRBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iwC/s+cKBJLJm4GhI4vYp9gWcjpiZUPy3WplVG2mvyZGSDGaV7LAaFSq09sLBI6QP
         0SKjcRoaCarLo4tN+2mvTJd7gM5lEG6Adik8nXRuwhX5fZymIMLOV5BpWkR6yV4HGv
         h1KeQ3aHdSMSHha5EZ+Xng8cXNX3yr9EDoC+UVkU=
Date:   Thu, 6 May 2021 15:25:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rui Miguel Silva <rui.silva@linaro.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
Message-ID: <YJPgO6TPyuY0w0EH@pendragon.ideasonboard.com>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <YJPJ3aKf9BdQ8UKx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YJPJ3aKf9BdQ8UKx@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Thu, May 06, 2021 at 12:50:05PM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> > The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB controller.
> > There is already support for the isp1760 and isp1761 in tree, this series extend
> > the support also for the isp1763.
> > 
> > Move register access using regmap, remove some platform data and code, refactor
> > the mempool, use dr_mode to align to existing bindings, then add the support for
> > isp1763 host mode, add bindings files that did not existed and at the end
> > add also support for peripheral mode for isp1763.
> > 
> > @Laurent and @Sebastian, I add both of you in the bindings files as maintainers
> > (it is a mandatory field)since you were the ones which contributed with the
> > initial code and peripheral code, let me know if you are ok with it.
> > If yes I may send a follow up to add also entries in MAINTAINERS file that it is
> > also missing.
> 
> First 3 patches now applied, feel free to rebase and resend the rest
> based on the review comments.

That's a bit fast, I've just review 1/7.

-- 
Regards,

Laurent Pinchart
