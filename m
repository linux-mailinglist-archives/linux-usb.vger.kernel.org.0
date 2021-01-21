Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01CB2FF46A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 20:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbhAUTXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 14:23:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30570 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727218AbhAUTWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 14:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611256887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g0aS4AONE7AtDdB3h9fjwmxX+qMQIQ66kQL2fFO5XBo=;
        b=Y1dNJz7KPWkNg0ekajr/YBv4I03KYEg2LVRWD702ShYvfIgEUebysO1vTYcUBbw3RCCCpA
        t/AhIzM2eAWd6k43PwZLINog8Sxj6fSj8MxAa9ij963M0sWJPxn3xGgfpDCzWL6T2mOhPB
        CYz1gxjxR7gRtp0fo8VOf28ybFRKCHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-_N1OU6jXPSaS2d7nEgitHw-1; Thu, 21 Jan 2021 14:21:23 -0500
X-MC-Unique: _N1OU6jXPSaS2d7nEgitHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C90BB8101;
        Thu, 21 Jan 2021 19:21:22 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-202.phx2.redhat.com [10.3.112.202])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CADC05D9D5;
        Thu, 21 Jan 2021 19:21:21 +0000 (UTC)
Date:   Thu, 21 Jan 2021 13:21:21 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Jeremy Figgins <jeremy@jeremyfiggins.com>
Cc:     Michael Sweet <msweet@msweet.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        zaitcev@redhat.com
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210121132121.68e58ce3@suzdal.zaitcev.lan>
In-Reply-To: <60f051f2-55ad-ab2c-ee59-df00558506f5@jeremyfiggins.com>
References: <YASt5wgOCkXhH2Dv@watson>
        <20210117234416.49d59761@suzdal.zaitcev.lan>
        <20210118163117.GA142198@rowland.harvard.edu>
        <B5544550-3209-4D98-ABA0-7FA389AED95F@msweet.org>
        <60f051f2-55ad-ab2c-ee59-df00558506f5@jeremyfiggins.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 18 Jan 2021 18:01:53 -0600
Jeremy Figgins <jeremy@jeremyfiggins.com> wrote:

> Pete, your proposed change does work. I created USBLP_QUIRK_NO_SET_INTF 
> because I was concerned about overloading the meaning of 
> USB_QUIRK_NO_SET_INTF, but if you think that's the better approach, I'm 
> happy to resubmit the patch.

I do think it's better, so if you submit the channged version,
I'll ack. But note that we need to get Alan Stern onboard too.

-- Pete

