Return-Path: <linux-usb+bounces-31111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9CC9C482
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 17:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32BB7349BC9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 16:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DD029D29B;
	Tue,  2 Dec 2025 16:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="T00ad531"
X-Original-To: linux-usb@vger.kernel.org
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52921299AB5;
	Tue,  2 Dec 2025 16:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764694028; cv=none; b=VZknh6aEWE3p4Br847V0TqS2AABX96CMksM/U0vQJKagyAxRUXzq79jf0/dAHj8IgXYxNwRvXYKWm760c/bnurhWsBUmunAvmuVszH35OkcWYtbgy8+haq+U3Wraakuy954vbtgOr+VG7QU9285CC4e+BthyMtpxG1yYHNbYsQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764694028; c=relaxed/simple;
	bh=a6CNrHYUVVv0+6MTS7aOYLrh5nYeoApTDHH0AC53Nqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B1iPmGh36r0whbSJI6e/c2joQIVBn6xn7/kgECEFU28vgbAMTkZbUtVRbBQ3Gxj4IilqtLLmODN7nqx/X95Z9yq3nyB3FBp0IjpzhYScdYbilsUMaaLsmAaU4NcFU+JF5PKgq4F+uZDZS0LY2Pn3YtJCg87kLrIGUwFfz8q+fn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=T00ad531; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vcLA44GB+j3H/KgnEoBAFvxWPC3E3xHZwmVHQdFIGl0=; b=T00ad531wXnzIFMw3Yu4znsnVv
	FzAzB4vIJ3w099X+OkXuCI9O6/QS8GsoCcSw0Z00NCpbVIki/cbnTeJgH/oMtczG16JYnX9HrdMht
	J2U85Fa2kq9O52204X+3VH6phez/aJHJ1ujn4r4bd9W3L2Rv9xRI6WxnN7T7cBt+QCaYdB+lDBzqe
	z1NW//Q6A22d31UzdMNL2/vT1iinnmZYW9UDGJGUJGeYRtEkMtcOebpNFoWYXFumt9mP2K+/QTSos
	BUaMTGceUlgZqwlDatvadZu8fwzMZ5ETWLUM/eYOrvEbtMv+akbP/b39guhLBLkWs34h4rLWMoAag
	8bHK++qA==;
Received: from [147.129.179.166] (port=56192 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vQTEF-00000009lNU-3BH7;
	Tue, 02 Dec 2025 11:27:52 -0500
Date: Tue, 2 Dec 2025 11:28:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alan Stern <stern@rowland.harvard.edu>
cc: Greg KH <gregkh@linuxfoundation.org>, 
    Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org, 
    linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com, 
    linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
    khalid@kernel.org
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style
 improvements
In-Reply-To: <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
Message-ID: <7093160b-3700-4bc7-300e-57f4507dffd2@crashcourse.ca>
References: <20251119130840.14309-1-clintbgeorge@gmail.com> <20251201203715.17768-1-clintbgeorge@gmail.com> <2025120200-backslid-endocrine-e64d@gregkh> <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On Tue, 2 Dec 2025, Alan Stern wrote:

> On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
> > On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
> > > As part of my LKMP mentorship i have to complete 5 patches as a criteria
> > > for graduation and thus have focused on working on such
> > > beginner-friendly patches so that not only do i get the required number
> > > of patches but also get familiar with the process of kernel
> > > developement.
> >
> > The LKMP internship should be done in drivers/staging/ as generally
> > coding style cleanups are NOT accepted in other parts of the kernel,
> > unless you get approval from the maintainer ahead of time.
> >
> > Does the maintainer of this driver want this to be used for the intern
> > project?
>
> In fact, Clint's changes are small and inoffensive enough, I wouldn't
> mind having them applied to dummy-hcd.
>
> However, Greg is perfectly right that this kind of stylistic update is
> not something that should be submitted for most parts of the kernel.  It
> just bulks up the Git history with essentially meaningless cruft, making
> it all that much harder to see the changes that really matter.  That's
> part of the reason for the suggestion that interns and beginners should
> confine their efforts to drivers/staging.
>
> Also, remember that trivial changes like this are fine for learning the
> procedure of submitting kernel patches, but the effects they have on the
> kernel itself are minimal.  A patch that actually fixes a bug or adds a
> functional enhancement would be a different story.

  FWIW, many years ago, I threw together a collection of kernel
"cleanup" scripts that scanned the kernel source for various possible
"improvements". Earlier this year, I posted a number of suggestions
for cleanup work to the kernel janitors mailing, and slapped together
a wiki page that described some obvious cleanups:

https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup

  As the first example on that page, look for code that insists on
manually calculating the length of an array when the appropriate macro
has been defined in include/linux/array_size.h for years. There's
still some of that lying around that could be tidied up; for example,
scan the drivers/ directory (do not make fun of my hacky solutions):

$ grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" drivers
drivers/hid/bpf/progs/hid_bpf_helpers.h:#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
drivers/media/common/tveeprom.c:	(i < sizeof(array) / sizeof(char *) ? array[i] : "unknown")
drivers/net/ethernet/mellanox/mlx4/qp.c:	for (k = MLX4_QP_TABLE_ZONE_RSS + 1; k < sizeof(*bitmap)/sizeof((*bitmap)[0]);
drivers/net/ethernet/intel/i40e/i40e_adminq.h:	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
drivers/net/ethernet/intel/iavf/iavf_adminq.h:	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
drivers/gpu/drm/xe/xe_guc_hxg_helpers.h:#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
drivers/gpu/drm/nouveau/nvif/fifo.c:	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
drivers/gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix) / sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c:	int arr_size = sizeof(input_csc_matrix)/sizeof(struct input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c:	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c:	for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))

  There are other ideas on that wiki page for someone who wanted
something simple to start with that aren't just aesthetic, they
would actually improve the quality and readability of the code.

rday

