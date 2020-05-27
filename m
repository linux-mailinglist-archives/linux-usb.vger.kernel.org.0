Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1A91E3C35
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 10:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388037AbgE0IiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 04:38:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:50376 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387858AbgE0IiI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 04:38:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CE1C9ADAA;
        Wed, 27 May 2020 08:38:09 +0000 (UTC)
Message-ID: <1590568683.2838.42.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 27 May 2020 10:38:03 +0200
In-Reply-To: <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 26.05.2020, 17:19 +0000 schrieb Joakim Tjernlund:
> 
> 
> This "u-boot SPL" is the first thing u-boot writes and somehow this is remembered, I assume, by cdc_acm 
> and gets echoed back when I open ttyACM0

Hi,

that makes sense, but it is not something that we could really
change in CDC-ACM, I am afraid.

	Regards
		Oliver

