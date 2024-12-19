Return-Path: <linux-usb+bounces-18680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8B9F7C96
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 14:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA781891754
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EA41CDFD3;
	Thu, 19 Dec 2024 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6OLvD0x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B01F8682
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616066; cv=none; b=CXlK9v5IzbMz9JHO+mCQmRWXK9qjhWElOtdMsLacGZWD+M8ojqivJzfV10FQZe5pPqF16j/KLOwWasabGofvrCjv95dUzdNPa+wajlPLs6IOmpZpPhTnG1irQewkQ+A45NJFQMLqL2v5646jMDPOspbYB2cqyL7Aj2MMSSBoeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616066; c=relaxed/simple;
	bh=acK0hHjKw3F+aYkk1dcDWtZ+xaVjOCwBXMe1ZtgZRAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kII2bgbplWNjDU7ar3OuXxY87ucmGWUrsRGSEOFFt35h+LPoR54En3h4I2sShy6sQ002FyJPUot0uCSSVOuSp36fN4mwnVWLn66AMePr6OetZESYubLDguV+oaVPmzwDKWFJo0TtC3Y3HAxqfvULZ0vBc9ynUP1d2dQiDp4bJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6OLvD0x; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so1191970a12.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734616062; x=1735220862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=atWjUMEd1NNeNbg7ZVaVBFb5YQIp4j939hl5v/bh6OY=;
        b=k6OLvD0xvwJvTnE+uHhtNx0pXjkVqQ+g3PrtYx6Hpbcpdn4krpdYa/39+cV5P/udQ1
         Ub0KYP4Yr2FHY7YJUdyOF9mVJzP1HR10ln5rnGso+4m4eTdBnanfF6pGds7TWVLVnRMi
         kXiITFyP1LFAiqdbOw8b7P2Nudy31UtnkfCVX+ndhgfp0w96BMXSniXWFFfyNhLpLSsY
         0C4iiEd3W/b6kV8mbBDEUtwiqN2Hh/6ae83kdCvx0mZ11tNnCuZcJsv/5H/8aBPO5h62
         SAxWPerW8t1RpGdHbMB8x8egHw7rPrkfBy4DOwbYW3pF1rwvlPL5BW/k+EhM8XDDDKzC
         oEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734616062; x=1735220862;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atWjUMEd1NNeNbg7ZVaVBFb5YQIp4j939hl5v/bh6OY=;
        b=I4kXAuoQO1T0hq9fSUehlftm5ENotoXWTTimymTE1LBcPmmSEI76x9euQr4895XqE7
         4sbNqVEt/5QjE7IfZsBngTfw/9LSGuN0eziNGX/5F3y4b/tNDkBX/1PcnIg3QggfpP9I
         jf4lB7QUrhou/hwSIaQjs1ori+VDtom9DF2ZePAi5M/3+fLejowfBLw5VUcLTdln4JM8
         tlrDeZeD0YSNOYoPaJmOqeNVXeasOLKc06yBKDMU2EVhss4GeEekvbx5dQdBQVFVasiR
         PvNTOG3Sc+HLVjoz4op/QxYj8236p2pviN1a3Jup4gmuXYtHY5oyEe8vegd/UxbqMEtA
         MgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmbD0gRQLaUElu3cjdbCI+rcbJ1ZrhDxzWVFH/CgoFK/9L/xe4VCUE3vGgeyg0sKE8yu4dXWdzg3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/pMqsAxzxQo0/0hFrwOaPkck7NA1qz0VvGPxyzGZ3ebSZ1ln
	s0O2S9CBTXirMdrUgv4RyeG373b7fGjBU0zemF84gYVWW5jTGjh69/PNLGTdyYQ=
X-Gm-Gg: ASbGncsXD96ObUw3/aVuYefDEVBqXxXOn4CK0nyLaXX09AThZJtwGjBib59TEQPmeh5
	1qhzZM2ISQSW4Z/M5g2Am8zt3ePpT5qKwB6pJ1YOBB8ksXPQct6RSD4tzQ6Bic0mYfTePQavHfl
	5Nb8nZ6de4IrUfCtkkH+RTucCsbuWSVGFkooZphBXMdN88g000VClmjy6CvzWQAPrtt8QC4knrQ
	xwhQffvkmtWFMnSK5518xfihbQ1jQR7OlhnArD219nJKpz1NQQSdi5A+0/p9Q==
X-Google-Smtp-Source: AGHT+IGsAFEMmOn8yfDvN6T2urlg0GTVfsukfftnbE1YSf5u37EqmGlhKJLLx7eviYZw/rCCQ2q3xA==
X-Received: by 2002:a05:6402:2807:b0:5d3:e766:6140 with SMTP id 4fb4d7f45d1cf-5d7ee3f5590mr6788805a12.24.1734616062067;
        Thu, 19 Dec 2024 05:47:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f397sm705444a12.22.2024.12.19.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:47:41 -0800 (PST)
Date: Thu, 19 Dec 2024 16:47:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Homura Akemi <a1134123566@gmail.com>
Subject: Re: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Message-ID: <d9f6af01-7a20-45aa-b6f1-380711aaec92@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen@synopsys.com>

Hi Thinh,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Thinh-Nguyen/usb-gadget-f_tcm-Don-t-free-command-immediately/20241211-092317
base:   d8d936c51388442f769a81e512b505dcf87c6a51
patch link:    https://lore.kernel.org/r/6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen%40synopsys.com
patch subject: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
config: nios2-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241219/202412192132.XB16SilM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412192132.XB16SilM-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_tcm.c:1308 usbg_cmd_work() error: we previously assumed 'active_cmd' could be null (see line 1265)

vim +/active_cmd +1308 drivers/usb/gadget/function/f_tcm.c

287b3d115e5351 Thinh Nguyen          2024-12-11  1227  static void usbg_cmd_work(struct work_struct *work)
287b3d115e5351 Thinh Nguyen          2024-12-11  1228  {
287b3d115e5351 Thinh Nguyen          2024-12-11  1229  	struct usbg_cmd *cmd = container_of(work, struct usbg_cmd, work);
287b3d115e5351 Thinh Nguyen          2024-12-11  1230  
287b3d115e5351 Thinh Nguyen          2024-12-11  1231  	/*
287b3d115e5351 Thinh Nguyen          2024-12-11  1232  	 * Failure is detected by f_tcm here. Skip submitting the command to the
287b3d115e5351 Thinh Nguyen          2024-12-11  1233  	 * target core if we already know the failing response and send the usb
287b3d115e5351 Thinh Nguyen          2024-12-11  1234  	 * response to the host directly.
287b3d115e5351 Thinh Nguyen          2024-12-11  1235  	 */
287b3d115e5351 Thinh Nguyen          2024-12-11  1236  	if (cmd->tmr_rsp != RC_RESPONSE_UNKNOWN)
287b3d115e5351 Thinh Nguyen          2024-12-11  1237  		goto skip;
287b3d115e5351 Thinh Nguyen          2024-12-11  1238  
287b3d115e5351 Thinh Nguyen          2024-12-11  1239  	if (cmd->tmr_func)
287b3d115e5351 Thinh Nguyen          2024-12-11  1240  		usbg_submit_tmr(cmd);
287b3d115e5351 Thinh Nguyen          2024-12-11  1241  	else
287b3d115e5351 Thinh Nguyen          2024-12-11  1242  		usbg_submit_cmd(cmd);
287b3d115e5351 Thinh Nguyen          2024-12-11  1243  
287b3d115e5351 Thinh Nguyen          2024-12-11  1244  	return;
287b3d115e5351 Thinh Nguyen          2024-12-11  1245  
287b3d115e5351 Thinh Nguyen          2024-12-11  1246  skip:
7735c10c74d903 Thinh Nguyen          2024-12-11  1247  	if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1248  		struct f_uas *fu = cmd->fu;
7735c10c74d903 Thinh Nguyen          2024-12-11  1249  		struct se_session *se_sess;
7735c10c74d903 Thinh Nguyen          2024-12-11  1250  		struct uas_stream *stream = NULL;
7735c10c74d903 Thinh Nguyen          2024-12-11  1251  		struct hlist_node *tmp;
7735c10c74d903 Thinh Nguyen          2024-12-11  1252  		struct usbg_cmd *active_cmd = NULL;
7735c10c74d903 Thinh Nguyen          2024-12-11  1253  
7735c10c74d903 Thinh Nguyen          2024-12-11  1254  		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
7735c10c74d903 Thinh Nguyen          2024-12-11  1255  
7735c10c74d903 Thinh Nguyen          2024-12-11  1256  		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1257  			int i = stream - &fu->stream[0];
7735c10c74d903 Thinh Nguyen          2024-12-11  1258  
7735c10c74d903 Thinh Nguyen          2024-12-11  1259  			active_cmd = &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
7735c10c74d903 Thinh Nguyen          2024-12-11  1260  			if (active_cmd->tag == cmd->tag)
7735c10c74d903 Thinh Nguyen          2024-12-11  1261  				break;
7735c10c74d903 Thinh Nguyen          2024-12-11  1262  		}
7735c10c74d903 Thinh Nguyen          2024-12-11  1263  
7735c10c74d903 Thinh Nguyen          2024-12-11  1264  		/* Sanity check */
7735c10c74d903 Thinh Nguyen          2024-12-11 @1265  		if (!stream || (active_cmd && active_cmd->tag != cmd->tag)) {

Testing for !stream is sufficient.  Another option would be to write this
as:
	if (!stream || !active_cmd || active_cmd->tag != cmd->tag)) {

7735c10c74d903 Thinh Nguyen          2024-12-11  1266  			usbg_submit_command(cmd->fu, cmd->req);
7735c10c74d903 Thinh Nguyen          2024-12-11  1267  			return;
7735c10c74d903 Thinh Nguyen          2024-12-11  1268  		}
7735c10c74d903 Thinh Nguyen          2024-12-11  1269  
7735c10c74d903 Thinh Nguyen          2024-12-11  1270  		reinit_completion(&stream->cmd_completion);
7735c10c74d903 Thinh Nguyen          2024-12-11  1271  
7735c10c74d903 Thinh Nguyen          2024-12-11  1272  		/*
7735c10c74d903 Thinh Nguyen          2024-12-11  1273  		 * A UASP command consists of the command, data, and status
7735c10c74d903 Thinh Nguyen          2024-12-11  1274  		 * stages, each operating sequentially from different endpoints.
7735c10c74d903 Thinh Nguyen          2024-12-11  1275  		 *
7735c10c74d903 Thinh Nguyen          2024-12-11  1276  		 * Each USB endpoint operates independently, and depending on
7735c10c74d903 Thinh Nguyen          2024-12-11  1277  		 * hardware implementation, a completion callback for a transfer
7735c10c74d903 Thinh Nguyen          2024-12-11  1278  		 * from one endpoint may not reflect the order of completion on
7735c10c74d903 Thinh Nguyen          2024-12-11  1279  		 * the wire. This is particularly true for devices with
7735c10c74d903 Thinh Nguyen          2024-12-11  1280  		 * endpoints that have independent interrupts and event buffers.
7735c10c74d903 Thinh Nguyen          2024-12-11  1281  		 *
7735c10c74d903 Thinh Nguyen          2024-12-11  1282  		 * The driver must still detect misbehaving hosts and respond
7735c10c74d903 Thinh Nguyen          2024-12-11  1283  		 * with an overlap status. To reduce false overlap failures,
7735c10c74d903 Thinh Nguyen          2024-12-11  1284  		 * allow the active and matching stream ID a brief 1ms to
7735c10c74d903 Thinh Nguyen          2024-12-11  1285  		 * complete before responding with an overlap command failure.
7735c10c74d903 Thinh Nguyen          2024-12-11  1286  		 * Overlap failure should be rare.
7735c10c74d903 Thinh Nguyen          2024-12-11  1287  		 */
7735c10c74d903 Thinh Nguyen          2024-12-11  1288  		wait_for_completion_timeout(&stream->cmd_completion, msecs_to_jiffies(1));
7735c10c74d903 Thinh Nguyen          2024-12-11  1289  
7735c10c74d903 Thinh Nguyen          2024-12-11  1290  		/* If the previous stream is completed, retry the command. */
7735c10c74d903 Thinh Nguyen          2024-12-11  1291  		if (!hash_hashed(&stream->node)) {
7735c10c74d903 Thinh Nguyen          2024-12-11  1292  			usbg_submit_command(cmd->fu, cmd->req);
7735c10c74d903 Thinh Nguyen          2024-12-11  1293  			return;
7735c10c74d903 Thinh Nguyen          2024-12-11  1294  		}
7735c10c74d903 Thinh Nguyen          2024-12-11  1295  
7735c10c74d903 Thinh Nguyen          2024-12-11  1296  		/*
7735c10c74d903 Thinh Nguyen          2024-12-11  1297  		 * The command isn't submitted to the target core, so we're safe
7735c10c74d903 Thinh Nguyen          2024-12-11  1298  		 * to remove the bitmap index from the session tag pool.
7735c10c74d903 Thinh Nguyen          2024-12-11  1299  		 */
7735c10c74d903 Thinh Nguyen          2024-12-11  1300  		sbitmap_queue_clear(&se_sess->sess_tag_pool,
7735c10c74d903 Thinh Nguyen          2024-12-11  1301  				    cmd->se_cmd.map_tag,
7735c10c74d903 Thinh Nguyen          2024-12-11  1302  				    cmd->se_cmd.map_cpu);
7735c10c74d903 Thinh Nguyen          2024-12-11  1303  
7735c10c74d903 Thinh Nguyen          2024-12-11  1304  		/*
7735c10c74d903 Thinh Nguyen          2024-12-11  1305  		 * Overlap command tag detected. Cancel any pending transfer of
7735c10c74d903 Thinh Nguyen          2024-12-11  1306  		 * the command submitted to target core.
7735c10c74d903 Thinh Nguyen          2024-12-11  1307  		 */
7735c10c74d903 Thinh Nguyen          2024-12-11 @1308  		active_cmd->tmr_rsp = RC_OVERLAPPED_TAG;

The inconsistent NULL check triggers a warning here.

7735c10c74d903 Thinh Nguyen          2024-12-11  1309  		usbg_aborted_task(&active_cmd->se_cmd);
7735c10c74d903 Thinh Nguyen          2024-12-11  1310  
7735c10c74d903 Thinh Nguyen          2024-12-11  1311  		/* Send the response after the transfer is aborted. */
7735c10c74d903 Thinh Nguyen          2024-12-11  1312  		return;
7735c10c74d903 Thinh Nguyen          2024-12-11  1313  	}
7735c10c74d903 Thinh Nguyen          2024-12-11  1314  
287b3d115e5351 Thinh Nguyen          2024-12-11  1315  	uasp_send_tm_response(cmd);
287b3d115e5351 Thinh Nguyen          2024-12-11  1316  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


