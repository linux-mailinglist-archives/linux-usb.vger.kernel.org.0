Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FDB2333CA
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 16:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgG3OHZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 10:07:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:38082 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbgG3OHY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 10:07:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1A584B165;
        Thu, 30 Jul 2020 14:07:36 +0000 (UTC)
Message-ID: <1596118042.2508.6.camel@suse.de>
Subject: Re: Patches to make multicast proccesing on CDC NCM drivers
From:   Oliver Neukum <oneukum@suse.de>
To:     Santiago Ruano =?ISO-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>,
        linux-usb@vger.kernel.org
Cc:     miguel@det.uvigo.es
Date:   Thu, 30 Jul 2020 16:07:22 +0200
In-Reply-To: <20200730135334.GN1496479@bartik>
References: <20200730135334.GN1496479@bartik>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 30.07.2020, 15:53 +0200 schrieb Santiago Ruano
Rincón:
> Hi,
> 
> Miguel Rodríguez sent this set of patches two years ago to fix the lack
> of multicast processing on CDC NCM driver:
> 
> https://www.spinics.net/lists/linux-usb/msg170611.html
> https://www.spinics.net/lists/linux-usb/msg170603.html
> https://www.spinics.net/lists/linux-usb/msg170567.html
> https://www.spinics.net/lists/linux-usb/msg170568.html
> 
> I've using a DKMS version of them, available in
> https://github.com/stbuehler/fixed-cdc-ether-ncm/tree/wip/patches
> since more than a year ago, and they are working fine with my Dell D6000
> docking station. IPv6 connectivity is broken without them.
> 
> Is there any chance to consider those patches (or what would be needed
> to make it happen)?
> It would be great to have them upstream!

Hi,

they have been merged on Wednesday.

	HTH
		Oliver

