Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33E81F1C43
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730264AbgFHPlS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 11:41:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:44802 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729580AbgFHPlS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 11:41:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 12DABB11D;
        Mon,  8 Jun 2020 15:41:21 +0000 (UTC)
Message-ID: <1591630857.24937.5.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 08 Jun 2020 17:40:57 +0200
In-Reply-To: <914176111c9eee651f402b499bc5ec49ff634e00.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
         <1590576068.2838.56.camel@suse.com>
         <c2c3eed27aa13f981690779aca00c420ce0beb06.camel@infinera.com>
         <d7f2750db8c2616fb74fc2e7ea006354e546c7fc.camel@infinera.com>
         <9971e8a97ea0f9d63864829fd8f2f4db897fc131.camel@infinera.com>
         <1591607631.24937.3.camel@suse.com>
         <914176111c9eee651f402b499bc5ec49ff634e00.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 08.06.2020, 11:39 +0000 schrieb Joakim Tjernlund:

> Most terminal programs I use tries to empty the read queue after open, just to avoid
> old garbage så I don't see a problem here. It it up to the terminal app.
> Maybe one could use O_DIRECT for this purpose ?

Well, we can throw away stuff received until some time in open(2).
But you can always have stuff in the buffer when open(2) returns.
User space needs to be ready to deal with stuff in the buffer.

	Regards
		Oliver

