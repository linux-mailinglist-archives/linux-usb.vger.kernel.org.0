Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284B52B69FA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 17:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgKQQZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 11:25:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:37192 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727443AbgKQQZS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Nov 2020 11:25:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1605630316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hd3g7fl2JCMUdoujM7aj21LdB0w+wh2IKhgX8tcLU8M=;
        b=hEzxGUCGVoEqPttXJGRDF4mXii1BRxvckAXGMJ6Yd+mAioc0C38QNjqBc59raHEKWlue9O
        dF0rCQS93o8gzesvil+hFmxYDFjZtcp8m+iWIzB1mGj1tSn6tnJjogNci6Tendhjmo2iV8
        JpvrXrCZzQ/H3f2lEF9CsNI8yjlp7lQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A8970AC1F;
        Tue, 17 Nov 2020 16:25:16 +0000 (UTC)
Message-ID: <4a3b2f07f854f6b90bc4772dfa2731388116cda1.camel@suse.com>
Subject: Re: Garmin 72h
From:   Oliver Neukum <oneukum@suse.com>
To:     ddhx <ddhx@madh.eu>, linux-usb@vger.kernel.org
Date:   Tue, 17 Nov 2020 17:25:14 +0100
In-Reply-To: <dba77dcc-5ff2-912f-2398-04f46be2966f@madh.eu>
References: <dba77dcc-5ff2-912f-2398-04f46be2966f@madh.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 17.11.2020, 10:08 +0100 schrieb ddhx:
> Hi,
> 
> Is it possible to add the Garmin 72h GPS?
> 

Hi,

to try we would at least need a device ID and a suggestion to which
driver it ought to be added to.

	Regards
		Oliver


