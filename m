Return-Path: <linux-usb+bounces-84-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E77A0DCD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 21:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC2B1C20A66
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 19:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB6C241F8;
	Thu, 14 Sep 2023 19:04:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400A10A2F
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 19:04:31 +0000 (UTC)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA25C9B;
	Thu, 14 Sep 2023 12:04:30 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 874D630007934;
	Thu, 14 Sep 2023 21:04:29 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 7B0C542AC06; Thu, 14 Sep 2023 21:04:29 +0200 (CEST)
Date: Thu, 14 Sep 2023 21:04:29 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	iain@orangesquash.org.uk
Subject: Re: [PATCH v18 2/2] PCI: Add a quirk for AMD PCIe root ports w/ USB4
 controllers
Message-ID: <20230914190429.GA15568@wunner.de>
References: <20230914145332.GA5261@wunner.de>
 <20230914153303.GA30424@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914153303.GA30424@bhelgaas>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Sep 14, 2023 at 10:33:03AM -0500, Bjorn Helgaas wrote:
> dev->no_d3cold appears to be mainly an administrative policy knob
> twidded via sysfs.

Actually the user space choice to disable D3cold is stored in a
different flag called pdev->d3cold_allowed.

The fact that d3cold_allowed_store() indirectly modifies the
no_d3cold flag as well looks like a bug that went unnoticed
for a couple of years.  From a quick look, d3cold_allowed_store()
should probably call pci_bridge_d3_update() instead of
pci_d3cold_enable() / pci_d3cold_disable().  This was introduced by
commit 9d26d3a8f1b0 ("PCI: Put PCIe ports into D3 during suspend").
Perhaps Mika can chime in whether this is indeed wrong.

Thanks,

Lukas

