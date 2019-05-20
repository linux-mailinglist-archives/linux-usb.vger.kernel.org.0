Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D313243F3
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 01:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfETXOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 19:14:53 -0400
Received: from emh01.mail.saunalahti.fi ([62.142.5.107]:33226 "EHLO
        emh01.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfETXOx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 19:14:53 -0400
X-Greylist: delayed 559 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 May 2019 19:14:52 EDT
Received: from darkstar.musicnaut.iki.fi (85-76-4-80-nat.elisa-mobile.fi [85.76.4.80])
        by emh01.mail.saunalahti.fi (Postfix) with ESMTP id 4FC2C2002C;
        Tue, 21 May 2019 02:05:32 +0300 (EEST)
Date:   Tue, 21 May 2019 02:05:32 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, devel@driverdev.osuosl.org
Subject: TODO advice for octeon-usb?
Message-ID: <20190520230532.GA3621@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm looking for input what should be done next to get
drivers/staging/octeon-usb out of staging.

Thousands of checkpatch errors/warnings have been fixed (starting point
was <https://marc.info/?l=linux-driver-devel&m=137028876225266&w=2>),
also the size of the driver has shrunken considerably.

If there are still some other bigger issues with this driver, please
let me know.

Thanks,

A.
