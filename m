Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F1E38CEA
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728823AbfFGOZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728572AbfFGOZv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 10:25:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CA8B20657;
        Fri,  7 Jun 2019 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559917551;
        bh=MYuahnEEXqgc6K+RhPwjR+1MO4tcWLOWmTTh5d1hYUA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=axFQoFrNA2n/l7xL6cIy4cR1QmXTi5eCmTEHSMYzg64NiFVpBjXxfya0tc41cwAb4
         PtY9OJAYkYxS6hCB1cj8CvOJuaiABlW/SFIz/MBN3DKEugFxiS6WROSbPfZwnSV8/y
         5k4i/4m8js/LIk5cZoPrAncoN03ClhU3TiLpcQWo=
Date:   Fri, 7 Jun 2019 16:25:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 5/5] usb: xhci: dbc: Document describe about dbc raw
 interface
Message-ID: <20190607142547.GH14665@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-6-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607063306.5612-6-prabhat.chand.pandey@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 12:03:06PM +0530, Prabhat Chand Pandey wrote:
> This patch have explaination about the new DBC interface called
> dbc raw interface. This cover the capability, target setup and
> use case info.
> 
> Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> ---

I want to see this signed off by Mathias first, before I review it...

>  Documentation/usb/dbc_raw.rst | 136 ++++++++++++++++++++++++++++++++++
>  Documentation/usb/index.rst   |  16 ++++
>  2 files changed, 152 insertions(+)
>  create mode 100644 Documentation/usb/dbc_raw.rst
>  create mode 100644 Documentation/usb/index.rst
> 
> diff --git a/Documentation/usb/dbc_raw.rst b/Documentation/usb/dbc_raw.rst
> new file mode 100644
> index 000000000000..b7d472a478f5
> --- /dev/null
> +++ b/Documentation/usb/dbc_raw.rst
> @@ -0,0 +1,136 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +======================================
> +This described about DBC RAW Interface
> +======================================
> +
> +:Author: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> +
> +Content
> +========
> +
> +- DBC Overview
> +- Motivation
> +- DBC RAW Capabilities
> +- Target Build Setup
> +- Target Test Setup
> +- Host Target Connection
> +- Experiment Test Result
> +- DBC TTY Use Cases
> +- DBC RAW Use Cases
> +- Conclusion
> +
> +DBC Overview
> +-------------
> +xDBC stands for the USB Debug capability provided extensible Host Controller
> +Interface. Universal Serial Bus is a host controlled Bus. Host Controller is
> +a hardware whose functionality is to manage usb bus and usb host ports. It is
> +responsible for initiating and managing all usb transfers. Extensible Host
> +Controller Interface (xHCI) is a register-level interface which provides a
> +mechanism by which the host controller (xHC) can communicate with the Operating
> +System of the host computer.

No need to capatalize Operating System.

> In addition to exposing register interfaces
> +essential for proper functioning of the xHC it also supports many extended
> +capabilities which can optionally be implemented by xHC.
> +
> +It includes Extended Power Management Capability, I/O Virtualization capability
> +USB Legacy support capability among many others.

What is "It" here?


> --- /dev/null
> +++ b/Documentation/usb/index.rst
> @@ -0,0 +1,16 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +===============================
> +Welcome to USB's documentation!
> +===============================
> +
> +.. toctree::
> +
> +   dbc_raw
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`

USB has more documentation than just this one file :(

greg k-h
