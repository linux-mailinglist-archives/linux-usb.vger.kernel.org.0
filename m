Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CF51D1D73
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 20:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390158AbgEMS25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 14:28:57 -0400
Received: from foss.arm.com ([217.140.110.172]:51788 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733310AbgEMS25 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 14:28:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 681AE30E;
        Wed, 13 May 2020 11:28:56 -0700 (PDT)
Received: from bogus (unknown [10.37.12.13])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85EBF3F305;
        Wed, 13 May 2020 11:28:54 -0700 (PDT)
Date:   Wed, 13 May 2020 19:28:51 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 20/20] dt-bindings: ehci/ohci: Allow iommus property
Message-ID: <20200513182851.GF27686@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-21-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-21-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 11:30:16AM +0100, Andre Przywara wrote:
> A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
> property assigns the stream ID for this device.
>
> Allow that property in the DT bindings to fix a complaint about the Arm Juno
> board's DTS file.
>

I need acks for this and the first dt-binding in order to take it
via ARM SoC. Also where ever possible split arm64 and arm DT in case
ARM SoC wants different PR. I will ask if you have to respin.

--
Regards,
Sudeep
