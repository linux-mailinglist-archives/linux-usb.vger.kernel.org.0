Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEF710553A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 16:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKUPUL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 10:20:11 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:45469 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKUPUK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 10:20:10 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 180CA24000E;
        Thu, 21 Nov 2019 15:20:07 +0000 (UTC)
Message-ID: <2f9b9dad3e8b390f70168b2fef1607f0b72ce7c3.camel@hadess.net>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Thu, 21 Nov 2019 16:20:07 +0100
In-Reply-To: <20191016093933.693-1-hadess@hadess.net>
References: <20191016093933.693-1-hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

Any updates on getting this into the USB tree?

Alan acked the patchset more than a month ago.

On Wed, 2019-10-16 at 11:39 +0200, Bastien Nocera wrote:
> This is version 3 of the patch set.
> 
> Changes in v3:
> - Add Alan's ack
> - don't export usb_device_match_id()



