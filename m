Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95B2F159473
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 17:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgBKQJK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 11:09:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:46720 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729511AbgBKQJK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 11:09:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 585F269B3C;
        Tue, 11 Feb 2020 16:09:09 +0000 (UTC)
Message-ID: <1581437342.8173.0.camel@suse.de>
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
From:   Oliver Neukum <oneukum@suse.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 11 Feb 2020 17:09:02 +0100
In-Reply-To: <20200211142855.GC1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
         <20200211135920.GB1498@kuha.fi.intel.com> <1581430450.1580.5.camel@suse.de>
         <20200211142855.GC1498@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 11.02.2020, 16:28 +0200 schrieb Heikki Krogerus:
> Do you have this ACPI node: INT3515 ?
> 
> It's for the TI TPS6598x USB PD controllers.

Hi,

this leads me to another question. Is this the only controller
that does this? Are there others and is this documented somewhere?

	Regards
		Oliver

