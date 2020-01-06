Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742E8131C19
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 00:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgAFXJu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 18:09:50 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27585 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726721AbgAFXJu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 18:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578352189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4yvpeUCKWQFvii1V6lPkSYNB3R9g2FXMlvIvs+njHFM=;
        b=AYeYWIf8rrcUn4KLRhfL5VvxUG7JSzMM4KCPtpl3K7RuO+/4xzNduJdlMHHGQjmdiCOCIw
        v/y/O4MP+2+9BnxvVHDngaMrdYP5LfVMECqygBy9KazlezAWPSKayJACug8GqHczpc6mBR
        QKRz/fOyl4wXTcYUEAaR/oG1rUXMYN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-FGQV8fGnM6OZE-jIoy_yBg-1; Mon, 06 Jan 2020 18:09:46 -0500
X-MC-Unique: FGQV8fGnM6OZE-jIoy_yBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15642801E77;
        Mon,  6 Jan 2020 23:09:45 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-116-146.phx2.redhat.com [10.3.116.146])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8B5061001920;
        Mon,  6 Jan 2020 23:09:44 +0000 (UTC)
Date:   Mon, 6 Jan 2020 17:09:44 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Tomasz =?UTF-8?B?TW/FhA==?= <desowin@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usbmon: Report device address assigned to USB device
Message-ID: <20200106170944.03a97034@suzdal.zaitcev.lan>
In-Reply-To: <20200106093724.22947-1-desowin@gmail.com>
References: <20200106093724.22947-1-desowin@gmail.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon,  6 Jan 2020 10:37:17 +0100
Tomasz Mo=C5=84 <desowin@gmail.com> wrote:

> Make USB device addresses match while sniffing USB communication
> with usbmon and hardware USB sniffer (OpenVizsla) at the same time.
> On xHCI root hubs the address is assigned by hardware and can be
> different than devnum.

> -	unsigned char devnum;	/*     Device address */
> +	unsigned char devaddr;	/*     Device address */

I think it's fine, the name of the field is not exported by a header
anyway, so there's no impact.

Acked-by: Pete Zaitcev <zaitcev@redhat.com>

-- Pete

