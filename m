Return-Path: <linux-usb+bounces-3060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 453277F216A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 00:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E7A1C21837
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2874A3B2A1;
	Mon, 20 Nov 2023 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7526D95
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 15:30:53 -0800 (PST)
Received: from [10.0.3.168] (unknown [93.240.169.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3733861E5FE01;
	Tue, 21 Nov 2023 00:30:35 +0100 (CET)
Message-ID: <7ac2c860-3ee4-4431-b52b-904cafd7f213@molgen.mpg.de>
Date: Tue, 21 Nov 2023 00:30:34 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Test USB Type-C port?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Linux folks,


To test a USB Type-C port for conformance to the specification, is it 
possible to connect two Linux devices using a USB Type-C cable, and run 
some programs on each?US

(I started using a Dell XPS 13 9360 from 2016, and sometimes experience 
troubles with USB Type-C adapters/port replicators and want to verify 
that the USB Type-C port works according to the specification.)


Kind regards,

Paul

