Return-Path: <linux-usb+bounces-2456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B377DF200
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 13:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297DD1C20F18
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 12:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907FC15E90;
	Thu,  2 Nov 2023 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBm5B3hT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08841171B5
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 12:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E5EC433C8;
	Thu,  2 Nov 2023 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698926861;
	bh=xSE58Aje/v66DeXgYWtNHYfh66tVbkIWO7Rg8XNcywo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tBm5B3hTGS4GZArwtuFrMD/sN7WSCmWjJHJLPCkd41R6u2M5sAXgAFpYNIdRTabEH
	 4mLPysXX912aTZQa5o0J1+MhZA0MNZY90D+t1bC5LdkEFma1iDlv6h11Vx7rPD4uCn
	 mJ8XRqVbVebOshN+IvuXMoSV83q5aMvJeg31uSEoEnXS2B3kw19uo5MJw/cakHe07t
	 odiyzoeXIPAN7t3KXeLcIUlDUefofkA4++ufUq4BK9936QgMXmaDi/zGcU1KALfMCQ
	 hRnINZgfeNL5Sk5pD3C/QRM3ZZZsYmxUuyQfOYSrj0waEJ1hZR6S5ZeBSzM62OcjjI
	 6Ti6KTn4/O3+Q==
Date: Thu, 2 Nov 2023 07:07:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, bhelgaas@google.com,
	andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Alexander.Deucher@amd.com
Subject: Re: [PATCH 2/2] PCI: Ignore PCIe ports used for tunneling in
 pcie_bandwidth_available()
Message-ID: <20231102120739.GA114661@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102103108.GK17433@black.fi.intel.com>

On Thu, Nov 02, 2023 at 12:31:08PM +0200, Mika Westerberg wrote:
> On Wed, Nov 01, 2023 at 08:14:31PM -0500, Mario Limonciello wrote:
> > On 11/1/2023 17:52, Bjorn Helgaas wrote:

> > > Lukas' brief intro in
> > > https://lore.kernel.org/all/20230925141930.GA21033@wunner.de/ really
> > > helped me connect a few dots, because things like
> > > Documentation/admin-guide/thunderbolt.rst assume we already know those
> > > details.
> > 
> > Thanks for sharing that.  If I move the detection mechanism as I suggested
> > above I'll reference some of that as well in the commit message to explain
> > what exactly a tunneled port is.
> 
> I'm not sure it makes sense to explain from the zero all this stuff that
> people can easily look up from the corresponding spec, such as PCIe or
> USB.

I don't know if it needs to be in the commit log.

I mentioned thunderbolt.rst because the text at
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/thunderbolt.rst?id=v6.6#n6
assumes that we know the terms "host router", "host controller",
"router", "tunnel", "connection manager", and I don't think that's a
good assumption in that documentation.

A little bit of introduction based on Lukas' text could improve that.

> There is a good picture in USB4 v2 ch 2.2.3 about paths crossing USB4
> fabric, perhaps reference that one? Or ch 2.2.10.3 that shows how this
> works with PCIe tunneling instead (although they are similar).

Thanks for these!

Bjorn

