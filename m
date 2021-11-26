Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0868C45F366
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 19:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237586AbhKZSIm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 13:08:42 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:54620 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238434AbhKZSGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 13:06:42 -0500
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 3.0.1)
 id 4f5217c7598b0a93; Fri, 26 Nov 2021 19:03:28 +0100
Received: from kreacher.localnet (unknown [213.134.181.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id 3CEE566ABF7;
        Fri, 26 Nov 2021 19:03:27 +0100 (CET)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/6] thunderbolt: Runtime PM activate both ends of the device link
Date:   Fri, 26 Nov 2021 19:03:26 +0100
Message-ID: <4690965.GXAFRqVoOG@kreacher>
In-Reply-To: <20211125073733.74902-2-mika.westerberg@linux.intel.com>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com> <20211125073733.74902-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.181.132
X-CLIENT-HOSTNAME: 213.134.181.132
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpedvjeelgffhiedukedtleekkedvudfggefhgfegjefgueekjeelvefggfdvledutdenucfkphepvddufedrudefgedrudekuddrudefvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudefrddufeegrddukedurddufedvpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhkrgdrfigvshhtvghrsggvrhhgsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjggvhhgviihkvghlufhhueesghhmrghilhdrtghomhdprhgtphhtthhopehmihgthhgrvghlrdhjrghmvghtsehinhhtvghlrdgtohhmpdhrtghpthhtohepghhilhdrfhhinhgv
 sehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhukhgrshesfihunhhnvghrrdguvgdprhgtphhtthhopegrnhgurhgvrghsrdhnohgvvhgvrhesghhmrghilhdrtghomh
X-DCC--Metrics: v370.home.net.pl 1024; Body=8 Fuz1=8 Fuz2=8
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday, November 25, 2021 8:37:28 AM CET Mika Westerberg wrote:
> If protocol tunnels are already up when the driver is loaded, for
> instance if the boot firmware implements connection manager of its own,
> runtime PM reference count of the consumer devices behind the tunnel
> might have been increased already before the device link is created but
> the supplier device runtime PM reference count is not. This leads to a
> situation where the supplier (the Thunderbolt driver) can runtime
> suspend even if it should not because the corresponding protocol tunnel
> needs to be up causing the devices to be removed from the corresponding
> native bus.
> 
> Prevent this from happening by making both sides of the link runtime PM
> active briefly. The pm_runtime_put() for the consumer (PCIe
> root/downstream port, xHCI) then allows it to runtime suspend again but
> keeps the supplier runtime resumed the whole time it is runtime active.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thanks!

> ---
>  drivers/thunderbolt/acpi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
> index b67e72d5644b..7c9597a33929 100644
> --- a/drivers/thunderbolt/acpi.c
> +++ b/drivers/thunderbolt/acpi.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "tb.h"
>  
> @@ -74,8 +75,18 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
>  		 pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM))) {
>  		const struct device_link *link;
>  
> +		/*
> +		 * Make them both active first to make sure the NHI does
> +		 * not runtime suspend before the consumer. The
> +		 * pm_runtime_put() below then allows the consumer to
> +		 * runtime suspend again (which then allows NHI runtime
> +		 * suspend too now that the device link is established).
> +		 */
> +		pm_runtime_get_sync(&pdev->dev);
> +
>  		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
>  				       DL_FLAG_AUTOREMOVE_SUPPLIER |
> +				       DL_FLAG_RPM_ACTIVE |
>  				       DL_FLAG_PM_RUNTIME);
>  		if (link) {
>  			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
> @@ -84,6 +95,8 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
>  			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
>  				 dev_name(&pdev->dev));
>  		}
> +
> +		pm_runtime_put(&pdev->dev);
>  	}
>  
>  out_put:
> 




