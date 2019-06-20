Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E424D075
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 16:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfFTOfd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 10:35:33 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:46684 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726404AbfFTOfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 10:35:32 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5KEStMB025647;
        Thu, 20 Jun 2019 09:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=pUwY5A+qP1OGkjq5BgFMrfclmi60HnMUS/pYtDGJ/3Q=;
 b=oBY2bZhTigmDkOkkjQIYsx9rIBoKZjWNRjMSpPW1gYK51YEFhDFRdVVXDPt8NnyOkrzp
 jf78XCYCCneG8sihqgoMZgr8zo37k//nIwzGL5L+lQlxL30onb5FBlwKY4AoQiXwQ/Ds
 A3N45PLbqUjnrbo5JTbIKm1l6Mohc7MMRBmyhsIdxehSgYHPPsFK60GpYfsuCwU8x0/O
 2aS8PwWVAVWMzsT4zKLgI/A5rCG0M8YD1TT6GU3FdCspfgHmssjeCb0oNFkM+qpn9Fvi
 VQMvxKdy9V46L49seS+bP5b1VwIqjqnAWsDukByMX6ElkEPWOm5LDA5BoZ5HO981o548 OQ== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0a-001ae601.pphosted.com with ESMTP id 2t780gjt6k-1;
        Thu, 20 Jun 2019 09:34:57 -0500
Received: from EDIEX02.ad.cirrus.com (ediex02.ad.cirrus.com [198.61.84.81])
        by mail3.cirrus.com (Postfix) with ESMTP id 7F851614C9F3;
        Thu, 20 Jun 2019 09:35:43 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Jun
 2019 15:34:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 20 Jun 2019 15:34:56 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 16C7244;
        Thu, 20 Jun 2019 15:34:56 +0100 (BST)
Message-ID: <1561041295.20348.4.camel@opensource.cirrus.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Date:   Thu, 20 Jun 2019 15:34:55 +0100
In-Reply-To: <1560935981.4587.10.camel@suse.com>
References: <Pine.LNX.4.44L0.1906181133570.1659-100000@iolanthe.rowland.org>
         <1560935981.4587.10.camel@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906200107
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-06-19 at 11:19 +0200, Oliver Neukum wrote:
> Am Dienstag, den 18.06.2019, 11:50 -0400 schrieb Alan Stern:
> > 
> > On Tue, 18 Jun 2019, Mayuresh Kulkarni wrote:
> > 
> > > 
> > > > 
> > > > You're right that the program needs to know when the device is
> > > > about
> > > > to 
> > > > be suspended.  But waiting for an ioctl to return isn't a good
> > > > way 
> > > > to do it; this needs to be a callback of some sort.  That is,
> > > > the 
> > > > kernel also needs to know when the program is ready for the
> > > > suspend.
> > > > 
> > > > I don't know what is the best approach.
> > > This is becoming tricky now.
> > Yes.  There probably are mechanisms already in use in other parts
> > of 
> > the kernel that would be suitable here, but I don't know what they
> > are.  
> > We could try asking some other people for advice.
> Waiting for an ioctl() is horrible. If you really want to do this
> poll() would be the obvious API. It is made for waiting for changes
> of states.
> 

Understood and agreed.

> [..]
> > 
> > The suspend callback is _not_ responsible for actually suspending
> > the
> > device; that is handled by the USB subsystem core.
> > 
> > These ideas are indeed applicable to programs using usbfs.  The
> > kernel
> Not fully. Usbfs has the same issue as FUSE here. Drivers are per
> interface but power management is per device. Hence every driver
> is in the block IO path for these issues. You cannot do block IO
> in user space. The best you can do is notify of state changes,
> but you cannot wait for them.
> 
> > 
> > needs to have a way to inform the program that the device is about
> > enter (or has just left) a low-power state, so that the program can
> > stop (or start) trying to communicate with the device.  And the
> > kernel 
> > needs to know when the program is ready for the state change.
> That has difficulties based in fundamental issues. We can let user
> space block power transitions. We can notify it. But we cannot
> block on it.
> 
> It would be easiest to export the usb_autopm_* API to user space.

AFAIU, usb_autopm_* API operate on interface rather than on device.
Due to this, they are *indirectly* exposed by appropriate class drivers
to the user-space class drivers cater to. E.g.: USB audio class driver
calls usb_autopm_* APIs when user space calls pcm_open(playback_stream).

> 
> 	Regards
> 		Oliver
> 
