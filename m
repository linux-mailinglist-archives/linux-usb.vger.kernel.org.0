Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 222EFE117B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 07:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733129AbfJWFHo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 01:07:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:46198 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728697AbfJWFHo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 01:07:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B432FAFCE;
        Wed, 23 Oct 2019 05:07:42 +0000 (UTC)
Date:   Wed, 23 Oct 2019 07:07:41 +0200
Message-ID: <s5hblu8can6.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     syzbot <syzbot+f586a582f79122007598@syzkaller.appspotmail.com>
Cc:     alsa-devel@alsa-project.org, andreyknvl@google.com,
        benquike@gmail.com, dan.carpenter@oracle.com, g@b4.vu,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        perex@perex.cz, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, tiwai@suse.com, yuehaibing@huawei.com
Subject: Re: [alsa-devel] KASAN: slab-out-of-bounds Read in parse_term_proc_unit
In-Reply-To: <0000000000005f6416059588cff9@google.com>
References: <0000000000005f6416059588cff9@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

#syz dup: KASAN: slab-out-of-bounds Read in build_audio_procunit
