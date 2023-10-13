Return-Path: <linux-usb+bounces-1572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873D7C8424
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 13:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1B70282D2A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 11:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F352134D8;
	Fri, 13 Oct 2023 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9C125A0
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 11:12:45 +0000 (UTC)
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00389C9
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 04:12:38 -0700 (PDT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1c8c1f34aadso2588024fac.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 04:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697195558; x=1697800358;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=by43HP5P2wCaYE3AXTk6u5hvUascQ0ivlvkmhO35+tQ=;
        b=D8RyLqcUVM1JucK6ba6H3Qhkaex3YzLu0PV9lCeIw8sFtAtB58t9K3kf+OcJDy1RtE
         XOXXnzHN5v/VfWKNHmXovQxC0//gzHI1Ry4LwrlKBEiWK/vqBfTeIFcd2RXpI9n4n19c
         utdYr7j5WgRWi71X3m66xRl5rjeyscA/yTGlBKqd8YbBEAkUzyiSuuTiye3u/B8criFg
         1enGibj0RrAo/LbsUGRtriKzzhVUDUFx8BtUkdoRxiOfnbmpf7XSTHdR2T3Bt6mDRcaH
         7O6geE2vdeL0mZiPaBx7JzW+5OxTLSh3dcRQE2lyfAakwTGhUu/B1f6piH9jC/IZVbQ3
         3XpA==
X-Gm-Message-State: AOJu0YymccGFNWUI+MNKCf/lVHx80P4NbQvYXng/Uf5j5jDJt8CCqBsk
	T984eYn55qf9BS7Y0fAzNHJmDpjrtwNoLdH8q8/Fr3jJ1Q9W
X-Google-Smtp-Source: AGHT+IGCzZxj4XP2AxDCBDfmXmKwgKGpaekW5mC0xmrgaIW7jCHJRwL8dDP2+4EGDMrZuT2UDhNy6IwuunhEZfEcajfHoYvbemzp
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:b782:b0:1dd:3076:9dfd with SMTP id
 ed2-20020a056870b78200b001dd30769dfdmr10505799oab.8.1697195556923; Fri, 13
 Oct 2023 04:12:36 -0700 (PDT)
Date: Fri, 13 Oct 2023 04:12:36 -0700
In-Reply-To: <ZSklqKDnv9OAGMC3@Sun>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000048edd60607972229@google.com>
Subject: Re: [syzbot] [usb?] linux-next boot error: KASAN: slab-out-of-bounds
 Write in vhci_setup
From: syzbot <syzbot+6867a9777f4b8dc4e256@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, linux-usb@vger.kernel.org, sfr@canb.auug.org.au, 
	shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git@github.com:ZenithalHourlyRate/linux.git/usbip-fix-wrong-platform-data: failed to run ["git" "fetch" "--force" "a8488ce2ff9e416d20038a4d32925ba1057cfba2" "usbip-fix-wrong-platform-data"]: exit status 128
Host key verification failed.
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.



Tested on:

commit:         [unknown 
git tree:       git@github.com:ZenithalHourlyRate/linux.git usbip-fix-wrong-platform-data
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e549f76cbaa1b13
dashboard link: https://syzkaller.appspot.com/bug?extid=6867a9777f4b8dc4e256
compiler:       

Note: no patches were applied.

