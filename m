Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF00B31CB46
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 14:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhBPNhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 08:37:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:42078 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhBPNhd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 08:37:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 00B30AC69;
        Tue, 16 Feb 2021 13:36:50 +0000 (UTC)
Message-ID: <5164bb01b7f3cf71926109a37b9e3957cfb630ba.camel@suse.de>
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
From:   Oliver Neukum <oneukum@suse.de>
To:     Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org, peter@stuge.se,
        lkundrak@v3.sk, markus@raatikainen.cc, pontus.fuchs@gmail.com,
        hudson@trmm.net, th020394@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 16 Feb 2021 14:36:37 +0100
In-Reply-To: <20210212174609.58977-4-noralf@tronnes.org>
References: <20210212174609.58977-1-noralf@tronnes.org>
         <20210212174609.58977-4-noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 12.02.2021, 18:46 +0100 schrieb Noralf Trønnes:
> +static void gud_connector_early_unregister(struct drm_connector *connector)
> +{
> +       struct gud_connector *gconn = to_gud_connector(connector);
> +
> +       backlight_device_unregister(gconn->backlight);
> +       cancel_work_sync(&gconn->backlight_work);
> +}

Hi,

this looks like you are creating a race condition where the queued work
may operate on an already unregistered backlight.

	Regards
		Oliver


