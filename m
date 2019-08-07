Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9EA3852E2
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 20:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389275AbfHGSWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 14:22:08 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40518 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbfHGSWI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 14:22:08 -0400
Received: by mail-qk1-f196.google.com with SMTP id s145so66594265qke.7
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=8YCZW1nCWkhUCnbT+gGC+VgekshYKuG5HsTIw4CfnXs=;
        b=CYNek6kNuhPECMxVcoFZkR4x+/i7TpMbbHYGRxCkTuhhbSELP9iE+d5GfCQM80n727
         C73sseXo7dWNu5DIvicVUTlvIU7LiUCj5R2c79YbsyOXgszrzYwtL8NtIm4a19EjmQic
         LQVaz6tYhl+anExo46prvpwWceTbh8d6mTlFViZ/52u1xVXviXlrIrKaiquiW0cnYupt
         RUZJrQvP7EyfIxNQlyQL5xIKi0fDBRRD5GTh3J/F2W8netpVFrI+oorXMCFEvKroQIeK
         GAeNcq5aFCTFy3+b8pJLifT0vcPc2CL1ZoSiRVRm9IuA481w8f5O4fPumcJpugnQXGwQ
         0XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=8YCZW1nCWkhUCnbT+gGC+VgekshYKuG5HsTIw4CfnXs=;
        b=sNkerdDihkZcVSWYWosQtLrI3GAvxrAClw/5hwSgbqypZGNCu6cy+qQTpAu5v33vS7
         eh39BYJtJ37TMwvTrPLhCMoZDpgjnH7eOCGvRdRRHTx0qFql+BXDD7PWqEqKuL6HiPJ5
         x82RT7gp+7fdO5YVly+QE7GGGqT8SqUBpNrtru+B/RufwdRstnQkJLAC+R0fRjRU3IRC
         QUWJGQTSAzcHN8y9J555FinK3eP2uMjo8Z8O4hE6IWJB33YTwOSehBVh2WYSGbzYRD4A
         N1CSxPMbfbzlNbki0snEIza2QXFj5uQQgo76p2Km5oJMGai9ZhbnFo2qfg4kZmBoS/vu
         uB5g==
X-Gm-Message-State: APjAAAUndMz7MWyt1oawjQWseo4gIcLVlSNk2mooMUkcPbBaGwi9EK7u
        u9Cc/fVQOPm8IOuHKoYbNi2lrw==
X-Google-Smtp-Source: APXvYqxLiJEoHXaO+qTFTbHn7VKcosbwrx21LONY6cRI/1DSZz1QuXvP+o5kbhMO0a7CEvXtfuUmbQ==
X-Received: by 2002:a37:6dc3:: with SMTP id i186mr121541qkc.376.1565202127476;
        Wed, 07 Aug 2019 11:22:07 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id t76sm40871746qke.79.2019.08.07.11.22.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 11:22:07 -0700 (PDT)
Date:   Wed, 7 Aug 2019 11:21:39 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        nic_swsd <nic_swsd@realtek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH net-next 2/5] r8152: replace array with linking list for
 rx information
Message-ID: <20190807112139.3eb53313@cakuba.netronome.com>
In-Reply-To: <0835B3720019904CB8F7AA43166CEEB2F18D04FA@RTITMBSVM03.realtek.com.tw>
References: <1394712342-15778-289-albertk@realtek.com>
        <1394712342-15778-291-albertk@realtek.com>
        <20190806125342.4620a94f@cakuba.netronome.com>
        <0835B3720019904CB8F7AA43166CEEB2F18D04FA@RTITMBSVM03.realtek.com.tw>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 7 Aug 2019 04:34:24 +0000, Hayes Wang wrote:
> Jakub Kicinski [mailto:jakub.kicinski@netronome.com]
> > >  static int rtl_stop_rx(struct r8152 *tp)
> > >  {
> > > -	int i;
> > > +	struct list_head *cursor, *next, tmp_list;
> > > +	unsigned long flags;
> > > +
> > > +	INIT_LIST_HEAD(&tmp_list);
> > >
> > > -	for (i = 0; i < RTL8152_MAX_RX; i++)
> > > -		usb_kill_urb(tp->rx_info[i].urb);
> > > +	/* The usb_kill_urb() couldn't be used in atomic.
> > > +	 * Therefore, move the list of rx_info to a tmp one.
> > > +	 * Then, list_for_each_safe could be used without
> > > +	 * spin lock.
> > > +	 */  
> > 
> > Would you mind explaining in a little more detail why taking the
> > entries from the list for a brief period of time is safe?  
> 
> Usually, it needs the spin lock before accessing the entry
> of the list "tp->rx_info". However, for some reasons,
> if we want to access the entry without spin lock, we
> cloud move all entries to a local list temporally. Then,
> we could make sure no other one could access the entries
> included in the temporal local list.
> 
> For this case, when I move all entries to a temporal 
> local list, no other one could access them. Therefore,
> I could access the entries included in the temporal local
> list without spin lock.

I see, thanks for the explanation.
