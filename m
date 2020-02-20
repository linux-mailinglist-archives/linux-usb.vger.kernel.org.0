Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6F5165A68
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 10:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgBTJqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 04:46:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:50332 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgBTJqv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Feb 2020 04:46:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3C0F0AE4E;
        Thu, 20 Feb 2020 09:46:50 +0000 (UTC)
Message-ID: <1582192003.6843.7.camel@suse.com>
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
From:   Oliver Neukum <oneukum@suse.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 20 Feb 2020 10:46:43 +0100
In-Reply-To: <24141.6739.313167.448875@beetle.laas.fr>
References: <24140.5498.228141.264272@beetle.laas.fr>
         <1582106185.9787.9.camel@suse.com>
         <24141.6739.313167.448875@beetle.laas.fr>
Content-Type: text/plain
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


