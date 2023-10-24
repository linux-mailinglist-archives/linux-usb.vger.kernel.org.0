Return-Path: <linux-usb+bounces-2123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 392217D4C1F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 11:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1440B20FBB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F112374E;
	Tue, 24 Oct 2023 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R3F3xzwT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732718E2D
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 09:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809DBC433C9;
	Tue, 24 Oct 2023 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698139638;
	bh=+OZ/RtjQyCJCTnws85wXqbhd+IrZjqPDKhLQnwiy5A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3F3xzwTzUU3+OaJD4RWUKFcrtjlg/tBftpB0s9sG7U9ER3EIot2eDOCkH8HJbvYb
	 PLBrd9bTbcF3dwATX3GHgxjZ18OSFkXPpZyizvyO6Pjpk0IxGuUqrwzRC/uwJckDD0
	 oCODsYu4x/dps3+7MgIie741cEhzX9TyEo+hEP+g=
Date: Tue, 24 Oct 2023 11:27:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Avichal Rakesh <arakesh@google.com>
Cc: etalvala@google.com, jchowdhary@google.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	m.grzeschik@pengutronix.de
Subject: Re: [PATCH v6 4/4] usb: gadget: uvc: Fix use-after-free for inflight
 usb_requests
Message-ID: <2023102440-retaining-eskimo-92b0@gregkh>
References: <20231019185319.2714000-5-arakesh@google.com>
 <202310200457.GwPPFuHX-lkp@intel.com>
 <738df245-e7d1-4fc0-9076-3ac5afebaa44@google.com>
 <2023102103-casually-wavy-6a54@gregkh>
 <CAMHf4WKgzvMoL6tKCiQYsuudQWgGBKkhfbmYgUxVXvLEqxi1GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHf4WKgzvMoL6tKCiQYsuudQWgGBKkhfbmYgUxVXvLEqxi1GQ@mail.gmail.com>

On Mon, Oct 23, 2023 at 02:25:30PM -0700, Avichal Rakesh wrote:
> On Sat, Oct 21, 2023 at 3:05 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 19, 2023 at 03:30:00PM -0700, Avichal Rakesh wrote:
> > >
> > >
> > > On 10/19/23 13:32, kernel test robot wrote:
> > > > Hi Avichal,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > [auto build test WARNING on usb/usb-testing]
> > > > [also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.6-rc6 next-20231019]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Avichal-Rakesh/usb-gadget-uvc-prevent-use-of-disabled-endpoint/20231020-025512
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > > patch link:    https://lore.kernel.org/r/20231019185319.2714000-5-arakesh%40google.com
> > > > patch subject: [PATCH v6 4/4] usb: gadget: uvc: Fix use-after-free for inflight usb_requests
> > > > config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200457.GwPPFuHX-lkp@intel.com/config)
> > > > compiler: m68k-linux-gcc (GCC) 13.2.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200457.GwPPFuHX-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202310200457.GwPPFuHX-lkp@intel.com/
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > >>> drivers/usb/gadget/function/uvc_video.c:231: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> > > >     * Must be called with req_lock held as it modifies the list ureq is held in
> > > >
> > > >
> > >
> > > Greg, apologies for the newb question: do you want me to upload
> > > the fix for this as a reply to [PATCH v6 4/4], or upload a new chain of
> > > v7s with this patch fixed?
> >
> > A whole new v7 series please.
> >
> 
> Had a feeling, so sent out v7 series preemptively. Let me know if that
> doesn't work.
> 
> v7: https://lore.kernel.org/20231020173626.2978356-1-arakesh@google.com/

I have already dropped that from my review queue as your emails crossed
with that, so I thought it was obsolete by now, sorry.

Can you send a v8 please?

thanks,

greg k-h

