Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFEE15928D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 16:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgBKPJU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 10:09:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:51482 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727668AbgBKPJU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 10:09:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 70EC1AC8F;
        Tue, 11 Feb 2020 15:09:18 +0000 (UTC)
Message-ID: <1581433754.1580.9.camel@suse.de>
Subject: Re: No PNP0CA0 device on a Dell Precision 5520 laptop
From:   Oliver Neukum <oneukum@suse.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 11 Feb 2020 16:09:14 +0100
In-Reply-To: <20200211144429.GD1498@kuha.fi.intel.com>
References: <1581427518.1580.3.camel@suse.de>
         <20200211135920.GB1498@kuha.fi.intel.com> <1581430450.1580.5.camel@suse.de>
         <20200211142855.GC1498@kuha.fi.intel.com> <1581431677.1580.7.camel@suse.de>
         <20200211144429.GD1498@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 11.02.2020, 16:44 +0200 schrieb Heikki Krogerus:
> > > Do you have this ACPI node: INT3515 ?
> > > 
> > > It's for the TI TPS6598x USB PD controllers.
> > 
> > Hi,
> > 
> > yes I got that one. Thanks for the tip.
> 
> OK, cool! Let me know if the tps6598x.c driver works with that.

Hi,

unfortunately it does not work. There is no port in
/sys/bus/typec/devices

The driver loads but it seems to do nothing.

	Regards
		Oliver

