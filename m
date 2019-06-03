Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB5432D42
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 11:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfFCJ6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 05:58:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:51236 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfFCJ6Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Jun 2019 05:58:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 78EB8AF41;
        Mon,  3 Jun 2019 09:58:23 +0000 (UTC)
Message-ID: <1559555890.25071.5.camel@suse.com>
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
From:   Oliver Neukum <oneukum@suse.com>
To:     Marco Zatta <marco@zatta.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Date:   Mon, 03 Jun 2019 11:58:10 +0200
In-Reply-To: <20190601075257.GA24550@jimmy.localdomain>
References: <20190601075257.GA24550@jimmy.localdomain>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Samstag, den 01.06.2019, 09:52 +0200 schrieb Marco Zatta:
> This patch fixes the chipmunk-like voice that manifets randomly when
> using the integrated mic of the Logitech Webcam HD C270.
> 
> The issue was solved initially for this device by commit
> 2394d67e446bf616a0885167d5f0d397bdacfdfc but it was then reintroduced by
> e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0. This patch is to have the fix
> back.

Are you sure only the C270 is affected?

	Regards
		Oliver

