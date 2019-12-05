Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC59D113F78
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 11:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbfLEKfs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 05:35:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:37420 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728707AbfLEKfs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Dec 2019 05:35:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 872A0B9DF;
        Thu,  5 Dec 2019 10:35:47 +0000 (UTC)
Message-ID: <1575542136.6107.3.camel@suse.com>
Subject: Re: Bug report: dvd player on USB3 port shows first GiB only
From:   Oliver Neukum <oneukum@suse.com>
To:     =?ISO-8859-1?Q?=C9ric?= Brunet <eric.brunet@ens.fr>,
        linux-usb@vger.kernel.org
Date:   Thu, 05 Dec 2019 11:35:36 +0100
In-Reply-To: <9269932.zcQTiTrDoZ@dalek>
References: <7725295.NyiUUSuA9g@dalek> <9269932.zcQTiTrDoZ@dalek>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 05.12.2019, 01:40 +0100 schrieb Éric Brunet:
> 
>  
> I am not sure what information to provide. Here is what happens in dmesg
> when I plug in the DVD:

Hi,

we need "lsusb -v" for both the error and the working case and "dmesg"
for the working and the failing case (clearly labled please) and
depending on that maybe a usbmon trace later on.

	Regards
		Oliver

