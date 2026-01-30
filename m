Return-Path: <linux-usb+bounces-32928-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FgrGA1YfGn6LwIAu9opvQ
	(envelope-from <linux-usb+bounces-32928-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:04:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13AB7C40
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B8C130305DC
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 07:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF7B2FC006;
	Fri, 30 Jan 2026 07:04:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C4A2EB860
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756647; cv=none; b=EzfRftrbLlmEDpHXjx7Wi2B8XB5tyqjHX728ujhe5G9axumUC0cNhIe2rqECOa/MWdAjWSt6AbUJUSY638jEdtVMPeNUkMlb/cwLCqKU9/2Zym1EhijGNHAbnP7EbIZPQUWauL8NW2hqZ4bCAWI9foMRiTeIs2zbeqpdOrSZUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756647; c=relaxed/simple;
	bh=BdRblF0eUIZYT8LxhwoalBg55iUruXhe9k2VLW0Z9c4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ey2FTgd+0ZAocCYndMfbkcYKBWpSEQbOpYJqYr42eididbhQi4aYdLlXY1RK09IJxo3OSlMUpfMfOdzcpmj/Oyb7dP7HMLZzxkHknrFA2NyTdYxRrEqBQP4rOcgjZsoeMse/acEedxCViZSA4jdGqirNrJf1O+urR28lSBXYk6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6610632db4dso6505467eaf.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 23:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756645; x=1770361445;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04yApS+YXO8wnw6pH0ng6f5u1qXXv/RDzIOLVNyCM8g=;
        b=heet8MvJCeeDYnx6ZndrHA32+Wz/0bcTGnhFlASX0/sySE0gSC1IwRvc7rgtTrcjh5
         1cJnjcK+uCA9VZCBkvYQl/KiuGZ1RR2vjgc1BMjhuEVbmtonAVmghLz39RApuTu8jiSH
         0WjUVz0lEGZtww0IkPd9tZ3S9/4m8qpdJFjVhfSVw4N1GFmg2XmXDFUZZh8A/EvyyQrj
         nhXbqiE7alEcafil26nRSl9TXhVgXHUSv9j2Jc/dHFfSrKoVyFpH1T5nrK7DVak99Rev
         UkC30194yFiOjIncq2XafSBCr+FiCH2pO36TEu5/muna3mVL6SXStlSn5p11vOtg8Hnk
         Nwfw==
X-Forwarded-Encrypted: i=1; AJvYcCV3mkw7NjC28IAHoNdTN4NRYfmGFa0MELgRdn7S5KvDsFZgMvMGRMy30aFeeh6Mdj8dT5OlxyxNcrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBnUH1tdY4F5Okr4nk4G4Gl0Z8+VX++Tc4TAUCCjuBm0kPuhA
	DfJMqT5WSmCuU5Pyv1EWXPA2B/3P+oUwwl2VQNwwCKyP7a5KS04NFfoYD89+6k2uetF5WmTvpqr
	7nzxJnO2BiWciDN98WhHBkAZXWhkFbW2+cFqOAMAXnYLEttAdMplPp+0GoIQ=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:150a:b0:662:f39e:efb2 with SMTP id
 006d021491bc7-6630f3aa2e5mr692232eaf.74.1769756645181; Thu, 29 Jan 2026
 23:04:05 -0800 (PST)
Date: Thu, 29 Jan 2026 23:04:05 -0800
In-Reply-To: <aXxOhV79TnuYaw0-@chandna.localdomain>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697c57e5.a00a0220.35f26.0011.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] WARNING in asus_remove
From: syzbot <syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com>
To: bentiss@kernel.org, chandna.sahil@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=aef5831c38e37e48];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32928-lists,linux-usb=lfdr.de,13f8286fa2de04a7cd48];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org,googlegroups.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: EB13AB7C40
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com
Tested-by: syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com

Tested on:

commit:         33a647c6 Add linux-next specific files for 20260129
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=140cf6ef980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aef5831c38e37e48
dashboard link: https://syzkaller.appspot.com/bug?extid=13f8286fa2de04a7cd48
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13ec1644580000

Note: testing is done by a robot and is best-effort only.

