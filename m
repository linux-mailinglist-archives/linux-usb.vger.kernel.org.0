Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6416B7AAEE
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 16:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfG3O2A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 10:28:00 -0400
Received: from mga07.intel.com ([134.134.136.100]:48735 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfG3O2A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jul 2019 10:28:00 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 07:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; 
   d="scan'208";a="190874842"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 30 Jul 2019 07:27:57 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 30 Jul 2019 17:27:56 +0300
Date:   Tue, 30 Jul 2019 17:27:56 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Matthew Nicholson <matthew.nicholson@adaptcentre.ie>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Linux 5.2, usb: typec: Support for Alternate Modes
Message-ID: <20190730142756.GM28600@kuha.fi.intel.com>
References: <CALko26OF4hqZ6-+KMarWU_skQj2mejgw++fShVQdAaEuQDQuiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALko26OF4hqZ6-+KMarWU_skQj2mejgw++fShVQdAaEuQDQuiQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthew,

Copying the respective mailing list.

On Wed, Jul 17, 2019 at 09:22:10AM +0100, Matthew Nicholson wrote:
> Hi,
> 
> Thanks for your work on the linux.
> 
> I am using dell xps13 with a wd15 type-c docking station, on Archlinux.
> Under kernel version 5.2 (and 5.2.1) I was running into some issue with
> having the docking station connected to multiple monitors (Only one monitor
> would work at a time).
> I tried to get the monitors working under X/xrandr and wayland/gnome.
> The issue is not present after downgrading back to linux 5.1.7.
> 
> I am wondering what I should do to report this or help testing.

I'm going to need some details about your platform:

1. dmesg output
2. The exact XPS13 version
3. BIOS version

The UCSI driver got support for alternate modes in v5.2, so I'm
guessing that is causing this problem, but to be sure, can you unload
the UCSI driver to see if it has any effect?

        % modprobe -r ucsi_acpi

Are you able to build you own test kernels?


thanks,

-- 
heikki
