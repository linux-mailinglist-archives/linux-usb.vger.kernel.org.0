Return-Path: <linux-usb+bounces-3707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441F803D42
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 19:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F291928112B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 18:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640822F86D;
	Mon,  4 Dec 2023 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcAL61BJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40538116
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 10:38:30 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ce557298f6so830467b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 10:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701715109; x=1702319909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9do+LSRoIck+Qn+ildOHg4179ETtCBAEZT+5wXNKAA=;
        b=jcAL61BJS90/mKdG+FUiCpo8xLxbVIUcNQK/grySgcY3dD8lCy/Y+30U7w4k4O1hca
         sAx/2KImLsujz7i4PaCDk1T9nmvMaJk7yDDVBMVdvVBBtvmv07R+zeL8txxJTxFcPQnE
         V633DFHFO4KINyMNsiH4T+YsZuLHGxofvjfVWU8hhdgcLGPZhhMogIPaAetZ86lLAiKw
         vM7I4PkNg/3KZa0iIRj2A/Wcl+prSvA+9MH7J0qHbOmD+iWErkW72YzWOJ+8SVCVLVtJ
         Z7GfzpNv7TcCh2+Huzxkcxa0JuGRSKz60f+newaLg/RfOZJZNKR2ssyz7m3gl3fp6+Wi
         JhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701715109; x=1702319909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9do+LSRoIck+Qn+ildOHg4179ETtCBAEZT+5wXNKAA=;
        b=XpnPpA+YNg9D7ydz30QNAlzbCcMpuKx2bSXG1OFcaaeIekFb2gJITpGSPvJtQ8Cs4S
         /eWzKpwu/9u0s1zSTycR+VLuCto5pWr0uvWoFFXi4U0FQ8iINuViXO0kTDyxg4QBR7fR
         nMb2bCb/araqpk7fsscD7A8TXhQ3a+3os6DQxjby2DoeP4cqXB2u+Gt7vRN9NHo2Zuw9
         pMhTxl/pXBGHCMqGBfbuGSxx9RZ5/pWtwv9M9YgjOsXwJoeMPTg+mw72OVEWQbhtSqXf
         4h/r9djq7LAQhJN9fAzsRcztHOLKZrt5OtFq3Ps0lOjmfVBr/a3YRgWqVPEotm69ReHM
         UtPQ==
X-Gm-Message-State: AOJu0YxAhqrJ5SSidKemD4MC8qaK79qJzTW22IusBVS7x4l5aiKO14ou
	mGeMVxoZe2qI1VIHKRo4UFKChhnrnHnV2MdX
X-Google-Smtp-Source: AGHT+IFcyyjWwJjrXmbvqg+BpD37A0zQsRAVAvOSWNkjhV29ujNkG+S6rV4qiPsw/LfHxW1VmZbEAw==
X-Received: by 2002:a05:6a20:7f83:b0:18f:97c:b9f6 with SMTP id d3-20020a056a207f8300b0018f097cb9f6mr3461232pzj.80.1701715109293;
        Mon, 04 Dec 2023 10:38:29 -0800 (PST)
Received: from hdebian.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id it4-20020a056a00458400b006cbb58301basm8238299pfb.19.2023.12.04.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:38:28 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oliver@neukum.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Question regarding CDC NCM and VNC performance issue
Date: Mon,  4 Dec 2023 15:37:51 -0300
Message-ID: <20231204183751.64202-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Hi,

I hope this email finds you well. I would like to ask a question
regarding the usage of CDC NCM and VCN on an ARM device running the Linux
kernel, connected to a host PC, also running Linux, via USB.

I have successfully set up a CDC NCM connection, where my device acts as
a DHCP server, and the connection is established without any issues.

Now, I have a VNC server running on the device. However, when I connect to
the VNC server, the performance is extremely slow and it also freezes,
making it unusable. Interestingly, when I simultaneously launch iperf3
using the same NCM connection, the VNC performance improves significantly.
The VNC remains smooth as long as iperf3 is active. When iperf3 finishes,
the VNC returns to its frozen or slow state.

I've tested the same setup with Windows 11, and in that case, the VNC
operates normally without any issues. I've also compared the network
traffic of both Windows and Linux connections using Wireshark but haven't
identified anything relevant.

Has anyone encountered a similar issue before? Could this be related to
the size or quantity of transmitted packages? 

Any insights or assistance on this matter would be greatly appreciated.

Thanks,
Hiago

